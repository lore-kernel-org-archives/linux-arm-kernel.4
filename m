Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C79606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:55:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SbwVr8tT;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MEXqB665
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=J494ajXgdNSDQDgG1hI5SAnZWfRn4U0a9SRkLTF+qp8=; b=SbwVr8tTRraUNti0UhoKKHCXbC
	RzEWcFZFBgqdL+ZrlYjcMzfRniZ/7Y67PA0ZfUHlbz8aCtzJdZDs5RGjq68Ua67i5Z8KPyln+cU5/
	+jH5v8o8N2rI0Y4X4wyeGIQqqJ4tu5KrpQsiip/BA2T1BQqp5MKKahZQsGzdo/mxzSRAuAHLi2KfB
	ZZ0csnLDC9xfsHuUSMIrhCRPWcAu8jbNTw7h1qSrU0W6BnmmmP4MvS9ieoR/zd5myLP6ZKZHdxVt8
	i1iSbsj2jdjj5k3w9XTikqPdPaVzzUsn3ZW0CnkUbrJh5InGstkORFYjskZW2bp831mHv+CppVNX1
	d6mTzlug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8EW-0000000DHzY-22dx;
	Thu, 19 Nov 2026 19:55:48 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU8EK-0000000DHtJ-0Bg1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:55:41 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so688995e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 11:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795118134; x=1795722934; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=J494ajXgdNSDQDgG1hI5SAnZWfRn4U0a9SRkLTF+qp8=;
        b=MEXqB6654PRpAYz+yiZ4O8hrT70s+crgOVSjUrNE5hGBzLLfNg7skKvsblR7jspvxd
         z5B4T6+cCQiAKnUKRuq8yMIpWuzXfFUwCi8thz2AxWKAh60aeY1Tlwd2YgJwVkdIqIYr
         /gmIaO5+DW5mh/3sltVEAp6PPvsg/R0R2MuYeFSKz6NTnFNjfn5pj4t1hXLQc5nxO1kp
         FKJD9ymTMhx15jCvi+qaiFbgaqVYZmOWy1gzqLWUkKJqZ/Bq6ditUKHXSzCw6Tf2L0nL
         x61sp3JfcyViX3PiLgvbXR47dsNTciadAAVjBC5Ne0AjixpVY/8aBG9dttF2isVYv4it
         MeLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795118134; x=1795722934;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=J494ajXgdNSDQDgG1hI5SAnZWfRn4U0a9SRkLTF+qp8=;
        b=DW2GHhKL5s0dmGoA2hSt4rYC13LVbFnTZuHGqaFh+x0yckAeUxVjyt5AoBXbYi8rZM
         4Z7mWL8dJ32EgyFerO/AJBKtsv8TCPvHYxc6vRxuXC12e9wu/zkRAs6lXY+4FFhDDpNR
         /3YevOKFZiZdVOfR7fuzpTNUFGZCAh/WL9KSHBd6hfaEqmaN4P6EHMpPO3RqCs1OM3u3
         moEGEii68k4JQsgpAbEqYhqmVaSHsgtmHBrAr9OPbPLVvERUtH96Yyt7HfqROEoiBrcZ
         zXpIuoXtNFSRRk0w+IqQ1f4uGBgO60BktU+fp2ERVxy1FNOCUgtUvxhgmkfq1/vvWtbF
         S5Ww==
X-Forwarded-Encrypted: i=1; AL+hErGN5v9614HeVsGL5cGww5Bl+Y5wfqdE+2sMN7iZCXSLL3i7hzfnqbEfcvy7T72d3+OZ9K/0mBWWFm+X7bP2X0Uj@lists.infradead.org
X-Gm-Message-State: APuU4Z9H3DTrPYUBYqJ+CYu6zXlms8rOPFRaKPbMOBdcyc6oIidNc8CB
	lb3TfpiEl3Q0d1A14sZiHkOwEwTIINEDGlbDpyfxrZjAE6xoRb2zfuIu
X-Gm-Gg: AYBFou1hHbM98Z8b3EV7gljCMtUOIpYCMqddVDrWXJIen2EcqoyJZOfd1omkYnvJnH8
	4IbvW22/J35yyF1RHRDTvkMhL1/7Da26WjcV/oBGPdXJDFo8DMCQ3YaoG6Dbc89TDff9S8/I/Xe
	W7d0SB4Vz4V0V6CR/G6I6mT2RUnX7nuaR5ZBBveIK7I9xxF1SxIqdGkCEDtPp1i4vgrnQe5phvo
	91BoOSBDnf4LX2bWW3Lk1bxRMc64nOweuplu8q2yi7OTurCoPIpl0d9eJ0XFYaLliQ+6kkqbbL8
	PQzFEyvGIDGwzYEZ+CyuxUuO8zJBQEgjRkbWLMm5x2tnvkeGrxGLIENzSJ5LLA4FzXbOqFh8jlV
	JlYeyfcZD0FjQNX7c+j37xn/OW4fBxmKPs8hqNx3iUXqOstjwxWsOIG4fD9f6iVZjEoAJo6D1S/
	yuIvaXYOU+NGjH2ZWcrY/w8zKHByp7tTsSoYPqa1Z/n4OochGOyUXx1wLvY47WgV4BfWTPfCk0N
	S3mAlSm4ClmSAnMyUfdJkuuSCcbODNIVWkMjzjzTIa2rCgidCbJKYqnfvnJZlSAaYU50IC+ub8L
	ppY8MzXEIoCdl0VZWbPqjs33oXlC1/RNSUJ4vB7bAs8ejkccnyfk7w1q5FjHJCluOVmtBQXmvi1
	imATzbn3vKhsZnDA=
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr14596235e9.11.1795118134040;
        Thu, 19 Nov 2026 11:55:34 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b1ebsm1442434f8f.33.2026.11.19.11.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:55:33 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v4 0/2] hwmon: add Raspberry Pi 5 PMIC driver
Date: Thu, 19 Nov 2026 20:55:29 +0100
Message-Id: <20261119-hwmon-da9091-v4-0-0d6e345c3666@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32Qy27DIBBFfwWxDubhAMGr/kfVBZjBRg12CsRNF
 eXfK9ubKKq6m9e5c2fuuECOUHCH7jjDEkucJ9yh4wHhfrTTACR63CEsmFCcc03G7zRPxFvDDCf
 aAthe+ROEEz4gfMkQ4m2Te//Y8wxf11hi3YvY2QKkZoAOjbVeSkfpEGvzCXmCczPngV6ujpY+0
 XOcrje6N9YZOsGt7lWyhs0QK0q2VMjr6k24n1OKtUPaSw7OGh+s9i2zzjrmtJSagQlaMdkqBUf
 p8GpyjKXO+Wd7wcI3l39fu3DCSZAyMBtMr2z7NiQbz00/p01oEc+weYEFYcSrXomj0MIaeIXb/
 +CWMMKlkYq10msnn+HH4/ELHm86wccBAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2518;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=/cI4BmFxoKWc90KomTwkD4ajHOQjKaHIToCOP5kHF2k=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/1Q1wgA3e428Qtm0wT5CTZ5vybYCO4ZZu9KBY
 Txxt2C/e6qJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9UNQAKCRB4zXhFDAXI
 Z2qVD/92RSkvrjfjxsSE86aeiDZ9N5WNEyNPjo+o4TKpWJOT/wL0FbY/Ru/hNi3rWf2q3tvxcUS
 Nhf5Fe72wZPhQ8m8GjfwJPciwxUs05AlUkfoiQVrCiySGjCiY1+Pgp3GfGvrIEbwtH+0cO915FE
 AXqXvNIFVDXniTTCuL/El5gzwRwJ7UyjQddF9RVyaNm8lYc7Pru+sLCEVDTlvz8Pzri50893nX2
 pVU3ZrsLxnDkHO1WGF/hBpcwE3LIUDrntPCa7u7KpsLB0F/p2A6We7evR8J81B3Z1FZc492sB3L
 5ZqGpZszzounlGZ/ykjC0WFQQM4YBLT9/tR8Bo0kDi3gVcAdPLbSR4SIfUeynZ2r7s8E3EAUgxa
 kQCZxLgwNLXwWl/ERkaL8lQNjnRsk8jikyhY+jz9U1yPHyJTK8U9SNa5YC8pjDeG/77sxiTBbXf
 B3P/xHeZSrfmHgbgoXnAPxPLLgEeoOf7uJb78TzkVx8jVzuWIu+8qTuZMvln+v02CfN1FsOqFHs
 4bdqiI4GzUnV+vlh1FzclHcGw5chhQ2HbDqfBqSW6UmuF3DtHiFpae6F9azJMdcLyfN4aHviEIH
 /ovZ6dnL0nwAkIKxSYe6CwovdllpiVM5kHm6AcpF2KCW5vx/g0M3lYg3ykFPy1wG64zDPDU/pqx
 bP3z4uOWYKYN/8Q==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_115537_076995_496CAA42 
X-CRM114-Status: GOOD (  15.81  )
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


