Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54937606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 13:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dXUf7WxI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MupZ6WDw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=; b=dXUf7WxIt2pGzF
	Nlkm5YqjEy/hCqdHB/Ysc098MSKCRJIPMYmShUOfDDtFfXjQDrp6irj+9EzsI9dy5cAZlR6uLNKNG
	PQBHCih6Jy0OTajvdsgM7Pmj2Lv/OFnEu19UglN9agmJU7+lexT/WfnfLk8/wwj176xNLHMO27+8V
	Uz9EkkB3U6p68V1cTYjWAtRPMV6GcioGL2MtnwlADIBlF47E78od5EBxk+0Aw0HTBCAKWZYJic9cS
	gyvKK/jYMO4yUqJ6QH+u2es7EdlTbAzigsasxkpeHVV0/yel/YmXn+C0eevEZ4OKytc45yhGT1hfB
	/HdxWDcFqOeofTzmvXXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ8r-0000000DI1b-22eP;
	Thu, 26 Nov 2026 13:04:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ8e-0000000DHvH-3gnj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:03:51 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-491971ac844so6226312f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698227; x=1796303027; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
        b=MupZ6WDwNbLNaWXuMxualxD+vDIaWbqh+cQ7QEE2aUd8tjprU4R+w4E5Lzyoekn1Ez
         1yWORFLZFx09fPtg2zt91+tpuxjWZ5G2FFAwCua26cr9n8B5bkVfgXKH4iS2HMWPMOWp
         dxEKSsF+TEBzWv9oaCByp1Db8q3SC37LqbC5oog36XA+cv12EwGoC5XlUW6Jl0NLCqoH
         NIzr/0iF6RV3VHnktR0QhYPDFJepVQUB/xwyLXDDQM9pwE/6CkV+PRtbxkKj+P41EmYl
         hEOYebIJyTtydUxyvAdHrC5o35rRsO1BBjCwCNDkjBWMgyfixArz7n4McMQTDZ38cbzX
         doGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698227; x=1796303027;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Pgy/LqViivjz+vBeamFRAxJjrlPLa2NnrUA8TY0Ipuo=;
        b=gwHDUVVktwi2Aa8+B/RoP/7TmC0XzXufDqIwS9Rg8iVN8Wbdz/EkaC9nRBbqUF5jYz
         bpEOrlplPaEbhX1GHn16InRt1vpRrTqzmtRm+8zy3Gdr/rppzftIearVZCwtMz7A3u1/
         Xj2yJoy0CROi4Z1sdPMKz0eYSSe5aotGXeEU/5C0uYAtX/I9lJ3KQJGemlQG+scgR8q5
         TA2do/qZJR7cVtOJhrMxd7Pwk8nfTvobeCmoXuW3Eg8AM8wA5Pk3Hwg66dHQf6Ay7/Si
         Lze2W3X9ephMjZknnqgvCg6wFkovyspbI/WrKYvIdescnCW9p9SrgWP7y2Y2ny7tTg+v
         C0ww==
X-Forwarded-Encrypted: i=1; AL+hErGiGwPt9QrVl8OTyspGiqU4yb60bAoblkvYqhWK5FjrEQXOE6NX/vPrXv13uFzzwnscDNPwUcVnXiyRVFJKFQCK@lists.infradead.org
X-Gm-Message-State: APuU4Z94+/vX+fGgLOooi/Mr6MH8jkNL8cT/X9AyIKoC0N/ZW+XoVd+3
	JCF3YDyQ7DqKLYyG3byqdf9YJPFahuVmbhse6TJcnB5Wm/kDV1IuHO2A
X-Gm-Gg: AZFdTZdoAOHpNxVF5uQsMdfvqRGP4VDzX5Ix5uMc8pm6ImaPqzDnzawyo3hFyEVpMRr
	viMvg/D+y+Gd6BKQ7SFUYW02rk4qmzV3oB5LEBfg4itg3mTeH+T1q2ULd92G2UpaSODwohh4Os/
	B6RAblXo2Eif8o+uFSCU4lPG/pQ9bMYBJwa999qAmDQ7DMgmDxV0/0gn8i1667Ct2zZRJVFjzZ6
	e/ryGCeAGN2w70y02GonpF1NV2mn3FTsWIZbLdSTcfbbj6vPg/peSozm9JUYPplo2PfdSQ7PyG7
	/nieh1SOFRv+pvE+o05BNpvLfcLoXM9bGh4t56orBcTExkPiMdM0J4CAsk30ztlvtww01Ul5LaJ
	oqtGoJDoN76SWnBz5j4O13E8l0VrqnboK17vJsfViwryEkWt9DNdTWVqL/yXhGw4l6Fp/mLWy8g
	+hLV/DV/7EMqqRJ2op8R/hddGtFFaXa79QhSq8EM+1Ktb9t5XYvoSWGhfhzQjV/cm0JzGu31r00
	JYIkQ5W6PYmOO5148xZsoIvdzjmvqj5531Aqa2TU6He8y/0Ejdj3lMxdlBUnkWiW/0dHninYg/c
	6skqarGhJWAFzROUY/oAp/Yt9uORuM02yrWNE+AS1izmDaLCRkS5vh+dCQmvlPObTpr7vNkK0fE
	t6AHOheDjfkTj888=
X-Received: by 2002:a05:6000:990:b0:493:ec0:861c with SMTP id ffacd0b85a97d-4abb0c5d53fmr39049675f8f.16.1795698226719;
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Date: Thu, 26 Nov 2026 14:03:29 +0100
Subject: [PATCH v5 1/3] soc: bcm2835: raspberrypi-firmware: Add PMIC ADC
 property tag
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-hwmon-da9091-v5-1-0c3570ba9133@gmail.com>
References: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
In-Reply-To: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Stefan Wahren <wahrenst@gmx.net>, Guenter Roeck <linux@roeck-us.net>, 
 Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1334;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=/iUxca9FTu0bgiQQeq8SBVCAGFP6lu621MvCErbuE0Y=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4xNEx4B4+w47Y6KIxfaxL7O51qs8bnihmov
 1fup0sxu1eJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 Z+MiD/46w5hTMfyhn4m39PvQETjkM33y7fxz8RsI96szfIvy31g1+2HfYzpr/qavjjnOw75LoKd
 XlkZVtPWoZ2D0h6fQKjCxfAc4faI2Jcaw76XaZuJCT95fLzAFeXPHZHp/KawJaoNQcQj/av+zoE
 h7gQfnhRTLPYQIXFz6oazBY+MzPmBoUZ/MW/XPl9o8nIpveCXi5//Qu/iG7PE3B8KqDpGjBRrxT
 ulKKDu7ga5hj3gR+GFwGd4z9oJhVXsfXVM9TOjMrrx3LwHhZviUe5H+uIf6H6tcedKHbXGo9udo
 EI3dP3yFy0NFJjUy2zONdxKU01sec/XYelCLf8W+auYJZvSatkpnawQbYiF+wpQ40Av/tKZacVC
 te9+fmlU0kKwLq/6ASwljDjKomGFulcwaS/5CimW8G5jY8N0vVVMB41N9l2TrVkD+g+s0sOc2lo
 xqeb29TF7WbUZiaB77bWifC6k5NoT6MMnpTDPjyktDaKd4bK9fhOB59Mos7wVKSogOsdTx6+IVz
 cIn1KmqP1qtRmLueWZ+LmSSsnyguANaEaOjc71jOaur1sr+xZdtqxO6/+4gFEvuY9DSwPQelNaG
 oZuPQpRKiUAABqOS0Cbi8MtYXOWAYLnNqTJGPYRlg+CcynVEAU5dsjAryEun5MdFMdwnpmzsfJv
 DsbZ8j75xwgtE5g==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_050348_965089_0BC5E31B 
X-CRM114-Status: GOOD (  10.29  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add RPI_FIRMWARE_GET_PMIC_ADC (0x0003009f) to the firmware property
tag enum.

Recent Raspberry Pi firmware exposes a structured mailbox property
that returns PMIC ADC readings (voltages, currents and temperatures)
in binary form[1]. This is required by the upcoming hwmon driver for the
DA9091 PMIC on Raspberry Pi 5.

[1] https://forums.raspberrypi.com/viewtopic.php?p=2391319
Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
 include/soc/bcm2835/raspberrypi-firmware.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/soc/bcm2835/raspberrypi-firmware.h b/include/soc/bcm2835/raspberrypi-firmware.h
index 20141eb2cb67..90d7b66b96e3 100644
--- a/include/soc/bcm2835/raspberrypi-firmware.h
+++ b/include/soc/bcm2835/raspberrypi-firmware.h
@@ -84,6 +84,7 @@ enum rpi_firmware_property_tag {
 	RPI_FIRMWARE_GET_REBOOT_FLAGS =                       0x00030064,
 	RPI_FIRMWARE_NOTIFY_DISPLAY_DONE =                    0x00030066,
 	RPI_FIRMWARE_GET_RTC_REG =                            0x00030087,
+	RPI_FIRMWARE_GET_PMIC_ADC =                           0x0003009f,
 	RPI_FIRMWARE_SET_CLOCK_STATE =                        0x00038001,
 	RPI_FIRMWARE_SET_CLOCK_RATE =                         0x00038002,
 	RPI_FIRMWARE_SET_VOLTAGE =                            0x00038003,

-- 
2.56.1


