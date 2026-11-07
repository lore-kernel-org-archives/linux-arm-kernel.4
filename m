Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CAA3606D804
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Nov 2026 18:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QGkzIsYx;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=e6t0lvzx
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=qIUo8w5jnVZGhZQV3yXbT0Mmx7eP44OB6GHW9QwQx2s=; b=QGkzIsYxl6vzuqEiGD2GDixTYs
	g9LEYxyV8bhA3lT/JraMYQG8mUP3EKr1i1nJ+FTEK2UzRtKtnhfNCg+2V86gsZE4E3kMP25g+MbPG
	RxhOe03HOi9ogPeQPUR1v941tB4z3D+YHoUvHLlciFl4EzoDO0buNALTKvP5nOB4jFi3dGn5lhaLF
	PgYu61FepevGGvok8OBKN0VNeEW9NtiXEhhXYNAAc5zlzoWLYLT3lh5TkdzDktTHJ1RPh/LNHuTK8
	QvdYrad8xFO0sA6s29I7gR6TtDoRYXKQBgzG0QRlfxLgAmVDiKwK/bo0m0A5NiWzhcd64o4cD633G
	4jEx6cMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3U-0000000F9qp-17LE;
	Sat, 07 Nov 2026 18:22:20 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPl3Q-0000000F9o1-2gql
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Nov 2026 18:22:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a2153c8525so12593885e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Nov 2026 10:22:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794075734; x=1794680534; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=qIUo8w5jnVZGhZQV3yXbT0Mmx7eP44OB6GHW9QwQx2s=;
        b=e6t0lvzxX2AvJEXZSjrm97PeSfTJNE4G4e4uijUVZH2OIhw1bxWtQoBmqc7q30Ag0T
         2L81Th/GfPFnw+Uqq0RLIl+tXSACcHyn03kaZpLHO8jEVb89O1evvEu11SxyyJYjFkmQ
         KFpXHINT33CGBlkXCWpjATTJUAGcsO8zYajc2pVf2iN2UAupQYeTVloRpHyOEtySU1aa
         TZqbPJ2+m37ntc5x4LTSh0T9I43IejVPYEVLIYdRb6ZF4//s+3pCZydSwFcVsVSXoLfZ
         C2B5Tl8ezoAsQ6XxJMS6rcmjqO0SMXs+Iqsr3n0eSgAPrv/ujcPnO4uYSIVyqX4H2Avn
         HsFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794075734; x=1794680534;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qIUo8w5jnVZGhZQV3yXbT0Mmx7eP44OB6GHW9QwQx2s=;
        b=vrdqvVpCEpP/0KTbAcha3bCxd658fI/Z438RjTv3+NDsrZ31jxtErfT72BfflcLWKp
         4ruLRicdz9Ey+/qWXqgsvmG59Wh1sc6uUvCK+iydR/617jluwBsmU5QDZTtXwnVVPjTz
         /clfB/VEIi1xU2ijPhN8sDqWmRLWcQJovxDgd/Z/f27WhDjybCN03bl1rTFW7Ao8nU7V
         WQPIF4ifEkYmaZD9zWc/SbjXn7VBPlw42AA0n85Oe3duSAiERt8AD4CNmsj28QmKWuYU
         gnDwzP2TqBeTyr8EfXuLiQhpH2sAkdGenI+0K6dBnzSTO8AAnRwSNrGoYokVxCfxdQrz
         2jSA==
X-Forwarded-Encrypted: i=1; AKwUvBxibMlYwvE+oYxX6hJGYQ690Scknhi7tybHg9kVEHH8fa1y1jyVjJQERQsikNvXNYmZtpv0oIEQvOVMt28GTE+N@lists.infradead.org
X-Gm-Message-State: APuU4Z/B7pyem2GU8spxqcBnnZubSeJT3h5SU1Nq4tl6mEFlHOlWRfR/
	K5H/5IuYAJ3aP6YS13vhZioYlqv1/RnhFLh3RJbHshIzlhOyAEKUg9YqUlq9oZQR7gY=
X-Gm-Gg: AYBFou0+MUmT8cx+JjceLUpWn8Rq0xsUssBuXNpUDLrSL0UVi0nHZWZ5xokPJaJuA8+
	VoHEjwZH54EXdIU0a2PmXf6is3prraKALH6cPLRSAXgpmByiAES7Qc2HggQumajrhl/QGXnZNXT
	mglcEnQDsjInFRlCYAenjTAlEXa6q9OOIdU6CTRBC2evImT4xK3vuEUmpxpmFtk81l87NYG1STD
	ycWZlqWuW45aUCrTrK8RIVtTHzwUVvIJpJODqvDf05V20twisJf62mNZRzISJdbyABRQ6rKSJnW
	a6/f7N2dnD6XTC87Po/uBW7qrA6sz3v7pkqqexym+08B7tzTsgIxkFNJQA5mN4Qbt4k0yya1N/p
	6VmDLeE+TzwjiqdJ7vfOfmc8Kciup0GYkGH2NdqQzs/HD/Pe/nipl3p4klRqu6BcPip6O8j3eLW
	1J8g9KRQOL3273oHa2MbrnHCm3uMDEiFstPvf6fRuU63utQvxvJB/5SMKhCYMbGrf2XCzPabMZN
	7WWdPO0Su/hAYgn2Oe+LeJes5YScgb8R53//h62f1Em+ptTqWT4KPhnqOAVMe/cBRO9kfiqlNPC
	AB4ZwGon6rrx2UlTndZv2KFxE3rfQT65Ft8ZJH1A0CNIfPR2FWkPGHGulF2PIL7C3r9ODbR/WgV
	wVHdqJQ4kyhq6WdPfj7kRN7z6wyyqirkOmAf5
X-Received: by 2002:a05:600c:348f:b0:4a1:f377:5c6c with SMTP id 5b1f17b1804b1-4b6de788f12mr102711915e9.10.1794075734154;
        Sat, 07 Nov 2026 10:22:14 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b76cbd082dsm59551055e9.1.2026.11.07.10.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 10:22:13 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v2 0/6] firmware: raspberrypi: Style cleanups and fix child
 device lifetime
Date: Sat, 07 Nov 2026 19:21:30 +0100
Message-Id: <20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NTQqDMBBA4auEWTslSTGhrnoPcRHjqAP1h0lJF
 fHupZ6g27f43gGJhClBpQ4Qypx4maFStlAQxzAPhNxBpcBq64zRHnveUEJaWxLZV8aeZfoEIWz
 pEZ22nfNlCYWCVajn7aLrplAwcnovsl+nbH71DzQb1Oi1vzsbvdGxew5T4NctLhM053l+AYDyQ
 Q3AAAAA
X-Change-ID: 20261107-fix-raspberrypi-firmware-be9c602d6755
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1762;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=0rEgn/6yzRAJIGB+6WT8d+hJikkPqbyZkdSE8/Lf2L8=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq72xV8RRfQstVxHlzO/Uw/9nrDdf3i1iA4/BKs
 TEh1kgTbNqJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCau9sVQAKCRB4zXhFDAXI
 Z2ZcD/0d0jRDf27K/pqicnJj9cUKv/CamEep7l9ryUSiGGLLSJIg3q0Xv+TjC9eSoBHMyG+KOOF
 0bkwyldbA9hOxWtKjTjPPzWL01c1TzWK0uRB6cdCYVMPtqYS9Gl5OB7eNYCyz3bgyIE4MhQ5/hL
 fuyD5ahh62gfkQ6rvIq7HawHP36v3U3yxZSJe1v+5THrE47/MOF3YxeCvzpZn6SE3TbZOa0iowr
 Ln2S1MwDY4WPIYYOU5l7ZDWtwzpcvokV3xBsG79w+J0mGJ2yGP3suAcLzUpbPWwwOj6xiRvAngY
 uGVDzXKLia9mvXL+ccIYXt6B2GNDqTF9zS/YO7xQmT3Fwgcc6mGZaqSiaQpSpWzid1CNdHmUQKE
 6Wel9sAnv7sdcvKQ+Xz6NTVu4l6bCFpbxXIkywmMkElBg6OaGRHu5ZY+XrKvGTk73gA3ORrkumD
 6ZIMYD9lbK7prNTKvi7K6EZ8L6nUcsvCceDfn39ZxIAotVRQ96dGKBbE+Jd9uAOSOT2vdaIFact
 SsZzJtuvKmcF2gNHkYu4OcbCfiq9ajjq71W8YRfsTnDp2MJU0vgU8uanNGSGyhQJi6+eqayxReO
 I7wovhglVMESvA4iGcpHkCLZwTHoMxD6aa1rwnhYmPVQrhFkxtqW0shkRouPv3rGpcKQCwuq6MQ
 o2iB7DlsmRRvyMA==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261107_102216_711485_773ED59A 
X-CRM114-Status: GOOD (  10.13  )
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
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series does minor style cleanups in the Raspberry Pi firmware
driver and fixes the lifetime handling of the hwmon and clock child
devices.

The first five patches address checkpatch warnings (missing blank lines
after declarations, incorrect indentation, unnecessary braces, and
undocumented memory barriers).

The final patch moves the hwmon and clock platform device pointers from
globals into struct rpi_firmware.  This pairs their lifetime with the
parent device and prevents leaks or incorrect unregistration if the
driver is probed more than once.  It also checks the return value of
platform_device_register_data() so that an error pointer is never
stored.  Registration failures are not propagated because the child
devices are optional.

---
Changes in v2:
- Move platform device pointers to rpi firmware struct
- Link to v1: https://lore.kernel.org/r/20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com

---
Sander Speetjens (6):
      firmware: raspberrypi: Add blank line after declaration in response_callback
      firmware: raspberrypi: Fix indentation of return statement
      firmware: raspberrypi: Add blank line after declaration in probe error path
      firmware: raspberrypi: Remove unnecessary braces in transaction helper
      firmware: raspberrypi: Document memory barriers in property list path
      firmware: raspberrypi: Store child devices in struct rpi_firmware

 drivers/firmware/raspberrypi.c | 61 ++++++++++++++++++++++++++----------------
 1 file changed, 38 insertions(+), 23 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-fix-raspberrypi-firmware-be9c602d6755

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>


