Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAA53606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 14:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rwKd2ltI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gd59wcHW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OeRjPPZqNacTwo8Qqr0CJwW7bzppscpQmV9mkBf/Brc=; b=rwKd2ltIFpKF3kIjj705l5PeaH
	6uBEOU9JRSFgytj3VQPv/CsGX4GEt1ynkxoP9iMN7zbBoRxYLgRpw888Xn42GLjbz3q83GP+OAvBa
	aRm9kXDRqPwmVOngVGP5cnsF9FogxEeeV3KY5/qcTyavp+hhBXdhDKYN/k0y8TQQuUoWLzqdUpHaU
	MP5oKLkJIC1i6O41EZ+HzjhpLARvfU2KpPeVl5wvZL3xCP78ALRSYApqfFF8pG+NTZTOz0Eam71QN
	1/FQedL4oajllFfZYs8L5ufXO5N/skEoHWh468Ujx8cc8LDY07Reu6KEO6X2/H6MWwVesXqzCU5ri
	8YAxJRUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ8i-0000000DHyC-02E8;
	Thu, 26 Nov 2026 13:03:52 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZ8e-0000000DHvF-3D0K
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 13:03:50 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so70043025e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 05:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795698226; x=1796303026; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OeRjPPZqNacTwo8Qqr0CJwW7bzppscpQmV9mkBf/Brc=;
        b=gd59wcHW0CYxnl51sPqYSeW7rLbdCUy0lq3GVWMlmvIaip+4JLh5SFyxPs/ML7PiAF
         6bcitF2CO78TQuJhiCN1M4P3hvFZ0tuvYj6oHeO+xJs9MOe4WntQJanoihYMRlAAPNtn
         NiWoThATcVR0EoErDr3SNci4vg8zlbM1Mbqfeiw0zYrbS7f2uU4gVHpjrTC5CpUnsGoT
         JVMW0ZkQsY6UZBixlTQNz5Ta8+YI7W+6sQjZDZ0aHraEdEMSB/KqKsGU6uGGff6TSmR4
         5TKvoZbVM9w19MKh7ATsVQpxIe+0H5uSAUzcp4PrmQ9tbVFGQYUl3FBNZyANe37X3RQd
         cwNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795698226; x=1796303026;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OeRjPPZqNacTwo8Qqr0CJwW7bzppscpQmV9mkBf/Brc=;
        b=Z51nZK198/SZ7NwGX7ewi3DPZitvm8ENjjMVL6MU4Q/V7plyaYCvwAnUUjRII6nQTe
         gJJmEv8Y3Nx66flUr3z6XccNGjYp1FaIvdBrEXLhL3s11eeeeAyrU6ZVwI9KL//Fmwa7
         +JjaFDnD+LCuXUPvgGl4J1Ha2qjiISSUIgf02U83nQvtxIXTkFtfX6hFU32EEcFFKkpS
         t35ZA0GduPfo3+4BOlySUQGPiDR7nX3fa9oc9CG5kULclc7/aWn0qB5IJrhUJ6HROytR
         pKGGbElFhEChOwxFLIHOdqkyeLGd1hLf8GJkJLP1dnOVrXQhPUWB+zIAqCtYdMMQ0BYF
         fedA==
X-Forwarded-Encrypted: i=1; AL+hErGGMyBS3n6lCj5QfAU6ViRkzy5W/A9Y6InQFra7Lqagt7FSh9r/wU5nbrzsTb9WadiAQ82kHxSWBm/TMRM4+YgI@lists.infradead.org
X-Gm-Message-State: APuU4Z9bWEnMZMFfdI6+3uiRLLuMIJtCtk8TIhJJXwduSkgHoZ89e80k
	Ctf+XMkG5xgJqXvV/qqVXTjZ3V/acSi8YOU9dz9zhiei4tPElwBiDVIH
X-Gm-Gg: AZFdTZcSXH4cAF1lBNPQg8r5pvhCFbDZ5yhUtOA9dUAUQLh4V3jFi8QW9XzXr5w6y4s
	jJZEsdQER5VXuY7KzHdtnONIKRQB7LAXPbVG/T/IClKfWwJ9TpnlK9w38JyoM3dFl1UR26aPoeR
	ZrGCttbHb+6srhdHrL3ofUDmUU4pkqV91Fa7fS/097bcCRXQLdjV9HhDDUpwpX7UYyds1HZEVPm
	Bp68oMIDmT+UQrt2zKmDVj5kTzv+liG6Iyvygcun5F4qrEm3VuYiH8QHxV1rTTW1dplivq87lUW
	DLCUNAtj4y51UdtpAcaPO/VDEn3fhOa/8c2xwoHUjPJHbox4gg8hu9Q6vQNLZBGZmB3Op4/nAMh
	GMJArdXfVXdO2Iml5SefLF1+2/AYNn7iwT/eCHODU4a6fvMcy9E53RKgkc0ZYDcTzimHGLYhdCK
	ZfriNWnJEvGye8VE15MrMJteBBYyj6gfLzUP2IRQCS+iUhvdi3ZL3FjmFHT4CG+G1oqYCQtebPl
	yEjSwjDHEzpYMn6MjMYKswJ3nXY3S8j2W7PvqLRmiSn8gYib1j7q+U7ZSCvFP9TavzAXsxgkzH2
	0blsHpbC/W565x79BQXxbpId0JPPRudYtFjUZdDyKtivufp1K2zIV5J+utjPD0y4u6no5e3GJ2T
	o5DESDlgJYk67wBc=
X-Received: by 2002:a05:600c:8486:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4bb88819468mr432182315e9.31.1795698226066;
        Thu, 26 Nov 2026 05:03:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dd55sm39331425f8f.30.2026.11.26.05.03.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 05:03:45 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v5 0/3] hwmon: add Raspberry Pi 5 PMIC driver
Date: Thu, 26 Nov 2026 14:03:28 +0100
Message-Id: <20261126-hwmon-da9091-v5-0-0c3570ba9133@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32Qy27DIBBFfwWxDjYYA8Gr/kfVBY+xjRrsBIibK
 sq/V7Y3UVRlN69z587ccYYUIOMO3XGCJeQwT7hD4oCwG800AAkedwg3tJGMMUXGnzhPxBtNNSP
 KABgn/RH6Iz4gfE7Qh9sm9/m15wku15BD2YvYmgykJIAOjaWcc1fXQyjVN6QJTtWchvp8tXV2s
 T6F6Xqr98Y6U09wK3uVrGE1hIKiyQXSunoTdnOMoXRIecHAGu17ozynxhpLrRJCUdC9klRwKaE
 VFq8mx5DLnH63Fyxsc/n/tQsjjPRC9NT02knDP4Zowqlyc9yEluYZ1i9wQyjx0smmbVRjNLzC/
 B3MCSVMaCEpF15Z8Qq37+CWUEK9BN4Kx6WUz/Dj8fgDiWJDVwQCAAA=
X-Change-ID: 20261117-hwmon-da9091-7aeeac6d8ef8
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2788;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=U0sVFyBC3QFd3x50V6URzXzlIDLOye/rcYLW6iCW/8g=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBrCC4x8u86m74sL2YYNiUcSPAW5L+l6TUbqXZ5E
 mNZvw2J2eGJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCawguMQAKCRB4zXhFDAXI
 ZwUGEACO5KfOjKPSb0GGpDmYGtb4Jqi8x00+CRsbRIv2B/iCwnIbqgV8H0AKiBHygp2yGx8Pm9b
 yBTaH2fwAezjZeows5pbvv3daCCXNBsRl2PJUBRSWogpsbeesifseRm4tY25agNO7cBb390Z9A0
 juLfBKsJRTkTmC8yD3Y0UjIrQX2UuAVZlk/K6tQCruhbW5cm4dOQIIqi36YnvdQ1qbOQpTR//4P
 OKBGXbVp7ocFGMA3kUgOAjlSbSutnlKpukbo9dhDMxiBMpSJnS2MZTFsdOK+KMifQufI/0k2Rwh
 huIMmkAvdB0seIVI4sNEcLecLSWaZrangpzbxBT0eaE1rJMDfrCWPQU0eugp5i3r34FpqD8LK6P
 YBWjpPPLzI3DVq+8HFjU9ZuE0GR93OXIHC69W0t+yuGJHmcOx1jDEhb1yriuEEIeNNgau9EcLsz
 Cv0ZJv0PW5JigRl4rRqcoKZ/uf3mHRw0mIOcluoPl/evUGSryDfYN6uhtfaaL/gg37kfC3XMcnU
 KQxsaYDf0cdSqctKiZifa4IyqjS6X14xYUYhUXYiodtnkiSCCMc/uJ7nol7BtdodRigJuy0pEJA
 HvFNQ7W0obmOREl452Xr+4yMJOwP3rx24HoGvN9fV2YcqQo6BiItyhc9LYQdB3zza+Ea8h8dE3Y
 n95KUz3kU+wV4Nw==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_050348_849493_43DE7105 
X-CRM114-Status: GOOD (  16.20  )
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

This patch adds an hwmon driver for the PMIC used on the
Raspberry Pi 5.

The PMIC exposes a set of voltage, current and temperature sensors.
Access is only available through the VideoCore firmware mailbox
interface; there is no direct register access from the ARM side.

A structured property tag (0x0003009f) was recently added to the
firmware. It returns the ADC values in binary form (index + length +
array of values), which is much cleaner for a kernel driver than
parsing the text output of the existing gencmd interface.

The driver follows the same instantiation pattern as the Raspberry Pi 5
RTC driver: the raspberrypi-firmware driver creates a platform device
at runtime, and this driver binds to it. All channels are read in a
single mailbox call and a short refresh-on-read cache is used.

The sensors are exposed through the standard hwmon sysfs interface so
tools such as `sensors`, collectd and node-exporter work without
modification.

Dependencies:
- Raspberry Pi firmware that implements property 0x0003009f
- CONFIG_RASPBERRYPI_FIRMWARE

Tested on a Raspberry Pi 5 with recent firmware.

Signed-off-by: Sander Speetjens <sander.speetjens@gmail.com>
---
Changes in v5:
- Split include into a separate patch 
- Move the firmware registration before the driver
- Link to v4: https://lore.kernel.org/r/20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com

Changes in v4:
- Fix sashiko reported bug 
- Link to v3: https://lore.kernel.org/r/20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com

Changes in v3:
- Fix sashiko reported bugs
- Link to v2: https://lore.kernel.org/r/20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com

Changes in v2:
- Add documenation
- Split firmware in a separate patch
- Remove DA9091 mention
- Remove extra lock
- Use 64-bit jiffies
- Remove lookup function
- Link to v1: https://lore.kernel.org/r/20261117-hwmon-da9091-v1-1-f55f0af9c6a3@gmail.com

---
Sander Speetjens (3):
      soc: bcm2835: raspberrypi-firmware: Add PMIC ADC property tag
      firmware: raspberrypi: Register PMIC hwmon driver on Pi 5
      hwmon: add Raspberry Pi PMIC driver

 Documentation/hwmon/index.rst                  |   1 +
 Documentation/hwmon/raspberrypi-pmic-hwmon.rst |  49 ++++
 drivers/firmware/raspberrypi.c                 |  21 ++
 drivers/hwmon/Kconfig                          |  11 +
 drivers/hwmon/Makefile                         |   1 +
 drivers/hwmon/raspberrypi-pmic-hwmon.c         | 296 +++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h     |   1 +
 7 files changed, 380 insertions(+)
---
base-commit: 7d51eba9dfa7d30abab0b75570e9f7605366e45b
change-id: 20261117-hwmon-da9091-7aeeac6d8ef8

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>


