Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0E32606A33B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1CIGqIjC;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jO2yTPl7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pDDz7EktSP59XcLYqPQZ3j+F7BRb1cRhTmRMviCYCf4=; b=1CIGqIjCRe77wnwLdi1PegZT/C
	5RDyLRGilzfAd4I92vGC4EWruXIXV74pJ0PZZEbaHEJUNiPMeB2VBW7YSRmYhDhvt5NqDo72/ETsv
	CxcX6+wBkIl7QOtVp5B9bOYoBoIpE9HV2po5Mz/CSmiILjHaBDZVStMOBpPiTFvSB6veH7Pkq95UA
	951F9lTXqLwr8G0tFh0XCbfalLSdenuBxL7LgWJ9Mbfqrpna6FfwJIyxAKj+TYEOJrvLXweeljvAx
	ZatA/22fZr9rwWlJIWUPdNlaBPRp1tYe9A7teqiJmcR4OIPbwXgFNkdRu4EgAKnoB9PDC1Vh0dtn/
	2vmsl/yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7RG-0000000D99o-1B0v;
	Thu, 19 Nov 2026 19:04:54 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU7RB-0000000D95y-03nn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 19:04:53 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-48e47347279so23627f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 11:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795115087; x=1795719887; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pDDz7EktSP59XcLYqPQZ3j+F7BRb1cRhTmRMviCYCf4=;
        b=jO2yTPl7yfP1Jwi73MvevERYtMYY/o4wkGzobh613gKSxXdTQwGAlkO7XMzbmE4H2i
         9sZJnQZ+0oNUF4PcxBi4NTBi55lrh+8yUfZ2DqDSkSmVqS5nA9qNjD3hQOiDkls5b1mf
         /bHj5+UMtuW/yXjCtbhUKXH7AzHrEgwyynOtl1diM+My3YMF03upoxL+EWmLZ0w6V/0j
         iQszRs+RBMV7vFh/ifqs0YZyKKSvOllAwD7roTEv0AxQClBZPHvuGBBD2bcqVG29FM73
         eSH2Q8GQyQpjuem/YXRtz13hHgGSpHeXNzDqJbnvy1xrQwd9lH5Lm125eWec6fYxu5PC
         HVdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795115087; x=1795719887;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pDDz7EktSP59XcLYqPQZ3j+F7BRb1cRhTmRMviCYCf4=;
        b=F6LeII009rf0ua37HHpWhI4HkplaoNy3JkVGbGE+SCYzj90UQ4YSNUZ/8rQfbraeW4
         uPnYU4FLfOIZmps/Uwh2ThA/lFKBiMozt8b1KGDdEsWLnCVkFBHuD6dQ/wf3oRZPKPhz
         SdKNm84QD4ldKM9pOZg79sdzQmHhjHfYoC2CbfKxyEGKcKE8fgQypbB13YLBY1836f1T
         7RugYdTMJUTxyYyxA5zFspuAGVOe6JilM+XMnk8RlS8OWYECD2h7psMfL9xzImsfeRhK
         3m5m5y2GDnXMaMaOO67mhdLquLCEyN9FOg2BPHK5Wb6t9T6XukHRaB19+0A7XsH3Vdxl
         sVPg==
X-Forwarded-Encrypted: i=1; AL+hErHkzfxJHRkeA8B5d4enGZY6CewmMJDkLRO5cfoHeAQC3iO3NIi4Fy5mihx1YC3MOWeEN5Fm4RvPOr3HFFtI08LX@lists.infradead.org
X-Gm-Message-State: APuU4Z+4GlIo6GpXUL+ln/RcIjwAlNuM2W852II7/vWfYDb65ZldTHCz
	Qn9A0G6U+c/3911KQQjGa7O6YdvjLTQbiEMe+EtW1vc/RpG04w3Xq3O4
X-Gm-Gg: AYBFou14G7Y3VqrUmzIQiTy1P4OcLfma12xGpAwUTfqy9FIfpG+pCnBWx1Bqu3tnWNX
	bzQhd+BHbxYpIQvpb39K+5qDycFJGzntwdsZaRw6nRH74HhFXz4cKW+j+GgiId0sly6VN7ys8Sy
	7oVFCms13TJCw5XCmVIEh2GszH8Ohz/9lvKwdAPFIgI530ouYDPM2AfrkpybXp9VR7e4biKpx32
	UGFdV+mX4ZqJnjTtLye0j6T1AidYm2nKR58KcjdWskeeyGwmdRu+0pFPS6Gd2LKAVMIMjlmKuiD
	0Xwxwc6FCtOPLSR6oTg4ra5OunGVlBzd3gHvqyLwZrKNPC+Ig6d/nGxkz9fCPrv9MaBrqUplRPv
	KATbgqA/fYJLbaGkcSUN4nLtZgcA/NGbM+aihfGiisAVjXIHbEQtHlAcqmm1Bfw1uk7pJUxCyBC
	SmSZyxFPzPxGs3L80Ptd5bHBl2SfaamqGU9hvqifOuI+NVblNU17QTPJzHYtzSv4myIlX5LOdLq
	nRJuMdAHfCP+ovU/YizsuOHIvuuRUJxcb18YMyv987JWCM+ztJhI/i86r8oOaRCq5bBAnxfBCaO
	sbJXxznOPqWFauFSeji3Mf+gE7V+NWxyv8UO1VsveNDk9D/n1u9h6IbZ/m0qPk+btsRpYTk25vx
	7siFgwAnTWuifWJs=
X-Received: by 2002:a05:600c:b90:b0:4a7:76fa:87e9 with SMTP id 5b1f17b1804b1-4bb8892cb02mr9574505e9.21.1795115086809;
        Thu, 19 Nov 2026 11:04:46 -0800 (PST)
Received: from zeus.unificl3slsbnxe8mz.com (212.71.14.70.adsl.dyn.edpnet.net. [212.71.14.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849247asm19124775e9.7.2026.11.19.11.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 11:04:46 -0800 (PST)
From: Sander Speetjens <sander.speetjens@gmail.com>
Subject: [PATCH v2 0/2] hwmon: add Raspberry Pi 5 PMIC driver
Date: Thu, 19 Nov 2026 20:02:22 +0100
Message-Id: <20261119-hwmon-da9091-v2-0-d6c624272a9e@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/21QTXODIBD9KwznIJAUiZ76Pzo5LLroTgMaINZOJ
 v+9o1572/cxb9/ui2dMhJm37MUTLpRpirxl5xPj3QhxQEE9bxk/q3OttbZi/AlTFD00qtHCAiJ
 0dX9Ff+UnxueEntY97ut24ISPJ2UqB8kdZBQlIbZsLGXOrZQDleobU8R7NaVBzk8ncxfkneJzl
 YeweWTEtRys2MZqoMIC5IJpW70Hd1MIVFpme6PRQdN7sP1FgQOnnDXGKmy8rZW51DV+GMe3kiP
 lMqXf/QWL3lv+f+2ihRbeGK/AN10Nl88hAN2rbgr89n6//wBMnwp1TQEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2242;
 i=sander.speetjens@gmail.com; h=from:subject:message-id;
 bh=fFksgnBQWB00eHnASxdxeUteEXHeuBQCQ15IXKORuiI=;
 b=owEBbQKS/ZANAwAKAXjNeEUMBchnAcsmYgBq/0hNMInIZvh+foa/m0C+DK7QywAYwMx3Oyj4B
 jegXlUSgAKJAjMEAAEKAB0WIQRWUkqLABoRw+7JUQF4zXhFDAXIZwUCav9ITQAKCRB4zXhFDAXI
 Z9WiEACGWtjwPpW1T2M8XP2Z7+frbRA4HCfF+uwJnRlGGWi8nOwaJ1rM2mS8GEUG2rSlU2D4T1Y
 Hbn2+3uxvs4U4+moO16OYVhh4msOTQY8LwhXGnC5oZ/jMov39laTFEM0Tph66QVcuFsUO7ZbOBY
 WOb+rZR/xD4zFlWco/b9hDEkk3ANlkxfCOT85yGSRRlcdRn+B/ZDCmezGiolycgL/NpoM5KDTfP
 qeDnA7rSZS50Zkr8Ok0pU16ic57AdC0pu7CwLC9LzSFB+l/pAYmLZGYUhzCGpsXDLC0KsEpaLy6
 vuvEUBp3PLtaY/zWlTYak75VJrETb5vR0joP5igmqC4V8fByLLRdvQNFg4n6Tjv0QN1tqyUX9AW
 9OOkj2JMQoIZspSFdAlj2EAnxGQ/Yu0FPnE7YX5kBmPGl6WrIsOiw8JB7oxdAswQPX9CqKmrhbC
 j5BS+E8RK1HrEQvpEN92DL84tOdwG54ODLlHwGAk6LSHbBgy+0Jo0ral7oE7fo9Jm/aGYiRP4ZV
 +hmfGVSMq+YuUNPuwld5c5WfwtyuzOvaMvBsXRv+7196C0gTMMCmFjou1VZ9Cwh44XaIKHa3wm4
 DLeUzEUkeLgb5QnL1nuxfhcydWqJv/SmW9gNawjlMpWIbcecbye2KmW7wL1OhKSZCTwuMYAqxt2
 w9nT+IrdviT/vKg==
X-Developer-Key: i=sander.speetjens@gmail.com; a=openpgp;
 fpr=56524A8B001A11C3EEC9510178CD78450C05C867
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_110449_079844_2CC12C22 
X-CRM114-Status: GOOD (  15.87  )
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
 drivers/hwmon/raspberrypi-pmic-hwmon.c         | 299 +++++++++++++++++++++++++
 include/soc/bcm2835/raspberrypi-firmware.h     |   1 +
 7 files changed, 383 insertions(+)
---
base-commit: 7d51eba9dfa7d30abab0b75570e9f7605366e45b
change-id: 20261117-hwmon-da9091-7aeeac6d8ef8

Best regards,
-- 
Sander Speetjens <sander.speetjens@gmail.com>


