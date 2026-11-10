Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47B98606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=44PEiFaj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=M94WyPkW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=4UCgQ7nO6Eimv1yLPkGHYS65lqVgFv6VK2LWqH/eDLA=; b=44PEiFajfsM9zfbZVDqjiX54hO
	6lNetz1kgEmYaCcV7B4wXOFspxD9J8UuSraZFx7g+15+D1HmdNEynKTNOt86eXHhPodmZlNaPnFx6
	43Et+0OZcCbG0AyPsvwXd+utaKzsnnvlCGVXXxHbtlUm4vQFJaUhgQbUQW0nfjSg9O3S5SiLG+Ubf
	w31vqyMccbCdImpzJd3PBwCRk0nKuZlZ76h+icarCpOgDDnQ5Kh/PzJCXcSDnedlsyYFWQqffCKQr
	8EUasfz3MCjZ1F6DqTX5AX3UyVOzaAzytaLB1rJ/HO9pa+0C1tiCWFHDH0DmUKB19BKcXE7gtMlZd
	77+CRutg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp10-00000004amo-04K3;
	Tue, 10 Nov 2026 16:48:10 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQp0u-00000004aiY-3aKj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:48:08 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so19579845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:48:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794329283; x=1794934083; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4UCgQ7nO6Eimv1yLPkGHYS65lqVgFv6VK2LWqH/eDLA=;
        b=M94WyPkW10PSuQ76Kn8JhLT45rwdiw7HJZssu542irtYTvzYYDKLpjjS656wBWW44T
         6cQAxSaLwtR2nkF965BWa7gcLzmCv7luBfVeDrmfBGI2lcyvTkVQfy4r+6NsS9fh7KXO
         WKc7zNZSeQilM0VPJgMIJEVmmw5cUSMfiim/2eDwyOIc2QV+SBKIK6LDnc3bATiuDOqp
         OGsCsCL+ktnkxbdB2MhJQBQ8GnAJ4PNwtp57cuaIBPlyiAycGDq6wj3MVxOA34OEIIKL
         nzXzLfntLQddFJQzIUO5AhS9b/ysjOdPpt2PIVuTAHf8HaNCsHzu5CB62p8ZXEdtyWg0
         uqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794329283; x=1794934083;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4UCgQ7nO6Eimv1yLPkGHYS65lqVgFv6VK2LWqH/eDLA=;
        b=eBMHkF0JXtD/St42qrr4pgwtCBn+RSa6p6V9GWAwRyEEOi5tNVcyPeij8uxjv7f1Za
         2AvQ3HTUy9oCBwUT6FVdaeN6sQC1glBErx3jlvpK/7Bt3MFMSZxV7S6eVKBg6BOjpICL
         cg5LCOLaOm3FLT5k6zYWepN8dRoOFG0acyr1KLiuqRDToTG+cHABi7bmqcwKdnFcJOcE
         EoyGO879Q1UfTFWps2muxevTRXZT5ioxUthGNNeKcGSniDfKv5WhBs15iOl6Ni+esSo7
         uuHCcJzm693ZOo3nXJc82AhZb3U59ekKjmgWaRhO7resVyQ2bB/b5U6RyrqWoDyZJvBJ
         WAwA==
X-Forwarded-Encrypted: i=1; AL+hErHiZotSkXFsnIDmdn57/1xj+EmmG+z0ymPE/GcUBgI3Kn49PsitzDE4MTr17LbQmpUjWxHi4f9ROHUsKZW0zVp6@lists.infradead.org
X-Gm-Message-State: APuU4Z9ZO9rEW+P5SbdAUnVyw9l6+iUxxCKijTH38l19AGcvajSlXwt5
	y/JLH0+NKp+6q42YQaSky3gq2PwUr7gcD1TSiyNZ17qVwA7SSyCG0Suv
X-Gm-Gg: AYBFou0BedyKj0tUQrQp8cN8l1LFr5E2DiHFg81twuYgoFbKHe0Y5VQ1YNeX2fqfh0P
	0qs0mb3fGAIFEJf3qILzsU6V28aK8RVMP+agn8sIL5zkHirg5YKwZuwnFyPaMe4uVe8itTPxLCB
	6u8MoWFXi8tyvGkXkqowso52dRJw9PzfqmPh9ERA6L5vi6aohLx+8wisPXsQeLiN+3cCzcueWjS
	O0EPbOffXJ6Pgg2CkFAPXiRbhliNjBBLpdAr64uzuwgvs/JsuSnyN3HZwwG8mlonKs2PXVVZWx8
	Sdy/OcjXn6FV4F6717chvelEDNPPaTAekaQf03NlZXr9pQk3KbiVwdBSy9sSFekMmDbGc5aLY/A
	/au4O2U49aoefmyuBLnQvcjlwMM+zzKtmjpHSMARHF4i2zQUe556m5oZ7zZvBcDNawm/4Wj4GOG
	dDGFvnDlrOeiPaModkBYQA/Ku89+chb72ss7XVt2EqBsh9O0bIr7iq7fpsnXpQPAuL6QUy26YmE
	khYrxj+Gc8+zkGOVUBAEtctQgHdBzA6BDvXhflM8KUBNLxXGQ6sM2TVFkLx9QrUaZrSmxZjg70m
	LsFPZTfsoICoUM5y8RXFsjSwto2LE08O+IAmWc5s9nmHM8rcjRjb6xs+d0X/8C9tJVdujdEUmRo
	pZnBOoXcgBGNY4cU=
X-Received: by 2002:a05:600c:19c9:b0:4a7:c366:d791 with SMTP id 5b1f17b1804b1-4ba02308537mr55624685e9.1.1794329282372;
        Tue, 10 Nov 2026 08:48:02 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0233e5d7sm58289665e9.1.2026.11.10.08.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:48:00 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v3 0/5] firmware: raspberrypi: Style cleanups and fix child
 device lifetime
Date: Tue, 10 Nov 2026 17:47:46 +0100
Message-Id: <20261110-fix-raspberrypi-firmware-v3-0-e001feb542dd@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/43NsQ6CMBCA4VdpbuZMW9I2MvkexqGUAy8RIVeDE
 MK7G5gcWf/h+1fIJEwZKrWC0MSZhzdUqiwUpGd8d4TcQKXAauuN0QFbnlFiHmsSWUbGlqX/RiG
 s6Zq8to0PzkGhYBRqeT7o+6NQ8OT8GWQ5TpPZ6wl0Mqgx6FB6m4LRqbl1feTXJQ097Ohkz0IWN
 bq6Ja9ddCm5f2jbth+b+czmCQEAAA==
X-Change-ID: 20261107-fix-raspberrypi-firmware-be9c602d6755
To: Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Eric Anholt <eric@anholt.net>, Stefan Wahren <wahrenst@gmx.net>, 
 Stephen Boyd <sboyd@kernel.org>, Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sander.speetjens@gmail.com, Manuel Ebner <manuelebnerli@mailbox.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=1sX+VjlacyXvU1AJ92+S1CM+u/53cA8H5C56y3oas8s=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq80q/J0bxEEftjI5WOvseJ8n8Q0hB4Z6sfzVaN
 PAU821BhPmJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCavNKvwAKCRB4zXhFDAXI
 Z6P0D/4uSDa4m0EZZHbNneYA1Ef4CNP51jJKIzjQnUJFajfKPKEt5mM8+PiPXHET/ZvgTidg+1a
 AhW+1KfPUtM2Rwgqq9iVFisWFTScAbLaG6lp0+7DOprxzqqR9KVFea+YB3BNJN1Bn/AnlTleaPK
 wgEKahgWSp0o1G4DP4EtJ5H64nKbiJ1C96rrDZRJxd29MPcOzhfvebEjwvE0iu06ChKQxzBPjCh
 Y5GsPcTTWWuYghBd8QIZOQLkpr0yOj6uNsAhjUnRV3Az9r1DwSeuPe/W6MSIvnWhGQafJrrXHb1
 jsDU/HyJ1wbu78hHMcORuHZiMXRPp35eFdJRsc61EqxMCZ9+FzGbVSfDshUelVndbJCTQLG1PsZ
 IUlwBeXV6Y4nuseczwUmpRyXfrxRs+7SeA89GIvNm5mEFO1P9Who3SZtMvHvDFQoB1US+SB9eov
 a+0vxtsLKZSaq7wI7GeHczW7qZfPVcloGpdlhY28sGw8UhRQMhkysogP2ERnpMN1R3NBYBial94
 i8phuG4yqdroSaoTr8K5KzrWBZB7Wppbe6/1Plaw3WZ0zvMDrUgReay4EVAskwmckiQU9Gyqzgh
 AA+Ug6HQSfpIs/DCc5eIbzgR42DvY01uMmFXhkm1JoMUjfguJXyL4k27EKEw3llevaJYLtj+jmp
 P1ZaqmP18/3J+Bg==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_084804_910110_4555BF59 
X-CRM114-Status: GOOD (  11.79  )
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
driver and fixes the lifetime handling of the hwmon, clock and rtc child
devices.

The first five patches address checkpatch warnings (missing blank lines
after declarations, incorrect indentation, unnecessary braces, and
undocumented memory barriers).

The final patch moves the hwmon, clock and rtc platform device pointers from
globals into struct rpi_firmware. This pairs their lifetime with the
parent device and prevents leaks or incorrect unregistration if the
driver is probed more than once. It also checks the return value of
platform_device_register_data() so that an error pointer is never
stored. Registration failures are not propagated because the child
devices are optional.

---
Changes in v3:
- Update cover letter
- Remove braces fix
- Update commit message 6
- Link to v2: https://lore.kernel.org/r/20261107-fix-raspberrypi-firmware-v2-0-5bfe605a5cc5@gmail.com

Changes in v2:
- Move platform device pointers to rpi firmware struct
- Link to v1: https://lore.kernel.org/r/20261107-fix-raspberrypi-firmware-v1-0-707362c710cd@gmail.com

---
Sander Speetjens (5):
      firmware: raspberrypi: Add blank line after declaration in response_callback
      firmware: raspberrypi: Fix indentation of return statement
      firmware: raspberrypi: Add blank line after declaration in probe error path
      firmware: raspberrypi: Document memory barriers in property list path
      firmware: raspberrypi: Store child devices in struct rpi_firmware

 drivers/firmware/raspberrypi.c | 56 +++++++++++++++++++++++++++---------------
 1 file changed, 36 insertions(+), 20 deletions(-)
---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20261107-fix-raspberrypi-firmware-be9c602d6755

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>


