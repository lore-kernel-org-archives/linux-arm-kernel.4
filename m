Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3C2606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PQSMhYKI;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lVg2xK0R
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ngmZliCBVIWdLZYwfTne0S7zcUfl4a7Lkkjc0y/n2eE=; b=PQSMhYKIzo+F8ugRaoXBC+YC8m
	1pvoQJEz+IXF36+pJLe3Uu7EM1rfjXCqgnaDUlQ9BE6KbeOHya6w3X467dD7fDfXFSiZdP9goCC2o
	E9A4jQb1/QDy3jA8JTnS2NwOCbOpIs+FP6+L5Ptb/o5LNIWMHOQIMPD8kFxXmGMD3coJoO7soZc7n
	gOc8oauqVZQ1t6iq3zcSMPNqvPjs9YX+O2IAa5LN9zEne/MCSNR0mRjj8KkAL/YiY9Pd/VBrLuF8V
	oOMEaUNTwRorEzyh7BEeShqc9uNmDb9ymJi+kdqJWc4dFWdC3MvsOiZw/cr2QhLHjWnfrV0zqjmy1
	A/iUPHTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU81Y-0000000DFRY-3e7F;
	Thu, 19 Nov 2026 19:42:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU810-0000000DEzm-3ifH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:41:58 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso33995f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 11:41:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795117309; x=1795722109; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ngmZliCBVIWdLZYwfTne0S7zcUfl4a7Lkkjc0y/n2eE=;
        b=lVg2xK0RyaHE+oC6Iti3I4XnpnKZAJwRzk6IcgPMW0sYRAbShnmgxttrKvcGxj4QhS
         pLAG/qi+rUptjRiX2kUhdsbmD8abyG0onCISSUHl0oaPKvYyEXeROiWL7+aGYikdiCXR
         k9ZI+sFkkPNYFIA8iCCagK6Yjas3Uu3HOT9jzgLIbo/FgaQj/lBlgroe0ROdXpvaAUbW
         945Gohlc4+ZlCJOSzNQ53rGZWGcabYXty1MjpLw1sZymGqW+edUmXdrIXW2vsQSeSj/H
         qfElzkTEaBo/BJPlNNA9V8ysQiUQ6lW5spMga6UzqAly58ahrJ585JcRex3RP/L4cfhG
         VbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795117309; x=1795722109;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ngmZliCBVIWdLZYwfTne0S7zcUfl4a7Lkkjc0y/n2eE=;
        b=eeoTEt3kpur8jaDZK7XI2K7LwvbaUaQHLzn3dSCinEhd2hmp6NPdo76RZSFcv0wcvd
         MLq9SBIH2T7BGwJ8ByatXlaxKrT/oqV4YJV2nUMLNNXj5Xhv06YbD49AyWOgi3VlT8J/
         EGXdc4GcErVz6LhPmHXoGOYrcOizBWZ/ekUqLTYwRWldk+z14eFpvd1VguQYzMEpUg7k
         ieEuqAHCOdjr18pXDyxW9kJzkQJ5vvQgf292v2SxrxqNZPsN2N0VofYa1XQiervgYn5b
         mdma/TbCLyt3ngMIL7WPU0xXntpFuEnIikIk5YL2i5CJlUKelEkaX9M2pVXaxrxwP3rf
         sstA==
X-Forwarded-Encrypted: i=1; AL+hErFt+qRr6y1He2daCvIimIQXuGRQq7bK3N2o3Fcxn7Nw5j2VKII5vKUK5gAVfKqoljtdcJi7GWIc/LlcykxsfQw+@lists.infradead.org
X-Gm-Message-State: APuU4Z8sOoKn0aDjZ6c98sbhh77fVIaVwIkHuLtVk2Kbvyw1GWrMsLO7
	pG7tEMr2HVcwQFNH39EkftUFB+kWrzu9yRdiu109wX9uBLIVpMFYBnQkna1Lu/E/P/E=
X-Gm-Gg: AZFdTZdsXWgeNbJDYrNNdwOhnA8/bEZ6ZwnONZNT2rR/zqzMNASBBSj+XpA+PY3iWfA
	FX1H4cytbWHVX3vPYX6Wgim9SpzsU1An24qIvBuQOlHDOUhMy1V1Zc6hovAByeAZs2Rh2wYBDJD
	LE3g89bxu/NE5w5d6ELU7muCN2DjmSn3I73f8lk0+yelC+6NrffK0zz5F9r3UDATM4LZKJttsjY
	bErBAQWEjZsko2gqNHMTI0JUJ7ac6FXSmgKPwO5OublRhtlJxApEMsC3z4hFf1vqnwlPgsOdwST
	Yx8nnSCSQjqGGPJFt3hBEeQxXXljqqH8a7UTLIaJXF3Cr3kXPfHY/rh+pvkPYjXhiWeiu91yKGd
	C5crj1G2CmgxVhYQRKep7N7TeQJkmMTQ8PCrEXSY0Nnf/caT/aHN3XakNHXW73PaDdD/Qvt/MUT
	1G8A7l8AvUwPcNpaWcFr+fMY9B3z7iib6BEf+Gyzjhxz6UJNLkbvM2QHIzaXdkSl8g4dPzbcGKF
	OBhNZs4QOJWlHcHukI+Q5vajmvLjRLpQjSbjZ9wNUzepKDrYb7Ygv9q8sIleLP5Yh4oXBMHKXue
	TVMsT2uoA8Bn6UMX+efcHoT6FYGN04WsU8ka5H82Hk/g9QgpoQjXR8n3KOQld8EQPqtLFmw5JCE
	ouOEGnYQ+sXWseKsk
X-Received: by 2002:a05:6000:188a:b0:4a9:4dfa:c150 with SMTP id ffacd0b85a97d-4abb2910440mr802988f8f.33.1795117308684;
        Thu, 19 Nov 2026 11:41:48 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110d56sm1375537f8f.40.2026.11.19.11.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:41:48 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v3 0/2] hwmon: add Raspberry Pi 5 PMIC driver
Date: Thu, 19 Nov 2026 20:41:45 +0100
Message-Id: <20261119-hwmon-da9091-v3-0-15956035d7b5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/21QS27DIBC9CmIdbMABgle9R9UFn8FGDbYLxE0V5
 e6V7U1UdTfzZt5n5oEL5AgF9+iBM6yxxHnCPepOCLvRTAOQ6HGPMKdcMsYUGb/TPBFvNNWMKAN
 gnPQXCBd8QnjJEOJ9l3v/OPoMX7dYYj1AbE0BUjNAj8Zal9K37RBr8wl5gmsz56FdbrYtLrXXO
 N3u7THYdtoJ7vVAyVY2Q6womVIhb9a7sJtTirVHygsG1mgfjPIdNdZYapUQioIOSlLRSQlnYfE
 Wcoylzvlnf8HK9pT/X7sywkgQIlATtJOmexuSidfGzWkXWvkrWf8hc0KJl07yM1fcaHglP5/PX
 9YuHaSKAQAA
X-Change-ID: 20261117-hwmon-da9091-7aeeac6d8ef8
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Guenter Roeck <linux@roeck-us.net>, Ray Jui <rjui@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-doc@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>, 
 Sander Speetjens <sander.speetjens@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2380;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=yJOPDLQoZxq0M0HwoMdMVCgup0u+fcMHSpG5grv9Ph0=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1D7Bp+PuNFkolK92E8hqdLfEGM/fT9WgFb6S
 tV0ogyCCpSJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9Q+wAKCRB4zXhFDAXI
 Z+nmD/9WJIQuY+FZyi7TV6Mlyu1e/Avb0VPyfPmghIdI/pM/MeOkW5TRUvGWntcanjFFcCEW0/z
 deTLPQO3uLhAijwsSjcoJWcxz93EvIK//MdZZQQDDRPbACV+a5roVPUX9N1/Vx8okYb12HB+S3k
 NLeELeowoItOiP8wzNGWVE1vPrtl+id/ENRlp+AgXZYXT6TnGVoNWyKfBf0VEnpaQB80oCmbnuR
 jwEGTpbEUO8E06lMchSCnAyyCDmK6KfMuXjLohMdONN9XWTxu856ncrqV5D7Ex+6ejQUhV7Y1ov
 V9y03bVVj7YDl3ljXs0Wcaq9UoJ2UEu/kpJRBsycGZe8i6C8pU5lf0qJmnVbBfyW6A5py90rXJp
 raFQqzDuOPUcHzAxdciiTOGHMIs0Wdtjg4OF4yuIOHg8ob+cUJmg+qFDh+wbd2qDEoQNV5fsYJt
 E5+zHO1NB+feixZUpxebO7T/OkAVZ78fJA/dEeuZ1+IEPiOm/NGYMFaZW1ND5fpK/Srg3ZaYDYg
 XYEf1EnKvv+FV6SF3BkjSoQLjc6SQjZkl+yCqbToFfZPPAizBMy/pKhfYYUB8oSIEzfsZ55wem2
 Bc+EuUuOgcCyAQH+NxJGJ/y0MQYBd8omtz0sz8B8fxRDDoBjdYYJ9oomvKcmHmblZbRR9aHylua
 rGIj8BYHaFBhirA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_114150_982794_CE374C80 
X-CRM114-Status: GOOD (  16.07  )
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
Sander Speetjens (2):
      hwmon: add Raspberry Pi PMIC driver
      firmware: raspberrypi: Register PMIC hwmon driver on Pi 5

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


