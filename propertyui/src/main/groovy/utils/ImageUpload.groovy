package utils

import org.springframework.web.multipart.MultipartFile

class ImageUpload {

    static String changeImageName(String contentType, String newName) {
        String[] parts = contentType.split("/")
        return newName+"."+parts[1]

    }

    static boolean writeImageFile(MultipartFile file, String folder, String newName) {
        try {

            File f = new File(folder + newName)
            file.transferTo(f)
            return true
        } catch (IOException e) {
            e.printStackTrace()
            return false
        }
    }

    private static boolean isImage(String contentType) {
        String[] parts = contentType .split("/")
        String type = parts[0]
        if(type.equals("image")) {
            return true
        }
        return false
    }

    private static boolean allowedSize(long size) {
        return (size < 2000000)
    }

    static Map<String, String> saveImage(MultipartFile file, String folder, String newName) {

        Map<String, String> results = new HashMap<>()

        if (file.isEmpty()) {
            results.put("status", "failed")
            results.put("message", "File not found")
            return results
        } else if (!isImage(file.getContentType())) {
            results.put("status", "failed")
            results.put("message", "Not an image")
            return results
        } else if (!allowedSize(file.getSize())) {
            results.put("status", "failed")
            results.put("message", "File is to large")
            return results
        } else {
            String imageName = changeImageName(file.getContentType(), newName + System.currentTimeMillis())
            if (writeImageFile(file, folder, imageName)) {
                results.put("status", "success")
                results.put("message", imageName)
                return results
            }
            results.put("status", "failed")
            results.put("message", "Failed save image")
            return results
        }

    }
}
