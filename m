Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCDF606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 16:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RWWBe4/C;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RPKFc9rU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=IVRbH9fbQr7HvpMOmMZEA1Ly5MPApVblIj53P80z6C0=; b=RWWBe4/CZkuGSs455Ae1pX4g9L
	+RHcHXAp5CarB+S/fTGvu+5ao5CSs1a1bw2Xy4vMWQr5VPzKbGDjZiTOFJ+JZvxr+n0qkcCmakb9p
	Usk/X/ebpq5Ghl0/xt4RjEcfwyzbRVuz/M5xYQNyqKCyN8A4Gw9L6aZTrHt0LxovvpJw36rS8q5tY
	+epEeV1bI9Od7wq/uVMIPcltkb8rtg9O8bVGC7HIjPHdEukw2Q2E2wHmNAEK8ZrETgYRbbr9t507r
	cfH9INI9QDr9CZpFk6A45OH+MIshcMHwjGurjh4BKW1Qqoq4cVOANiSeImDUA/FQsa18klpSS5mJa
	NZgl1KZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMNQ-0000000CvxB-063E;
	Fri, 06 Nov 2026 16:01:16 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMNM-0000000Cvw3-1jc3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 16:01:14 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-cdb75699c7cso195652a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 08:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793980871; x=1794585671; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IVRbH9fbQr7HvpMOmMZEA1Ly5MPApVblIj53P80z6C0=;
        b=RPKFc9rUc4/Q1UP7sncZAf4SBgI2WTuMAeLKzHJl66Er95x3mDn5UOX/ueYckSzz3B
         VX6ZEyG2Pr/qiKOwuXbvekz64pE/9pLicMNxlRzMZ8HuxdOqe2PoJZNKan944+S/Hdvd
         uMq8dy58eIa0xqGpMJMOXHOnVMkD8Jd6nYkgxT69nZpDpNvvFi9oPGxWmHq+RFAU52fU
         KI1nbk1Kjf9zvBh5f2yCENxSy+MfLiAphZVuK7QJ8oJKJ1k/EqN6iqLhC/SJG2vLc7W8
         S4kopFOdRpfZltlweuH+yk6T0+1LBozuB5tU46IRJniPc+ovdhMbBpaTyolAqtGeXV95
         l7PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793980871; x=1794585671;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVRbH9fbQr7HvpMOmMZEA1Ly5MPApVblIj53P80z6C0=;
        b=T/MQ7HxqNrpUIkyDMHePKI08OmyD3mIpaz7JHuPuW5U5/wB9DP38/UlTUNjZyP2Tsq
         p34qz3v2D8ukOyrGCrucP/IHcLJ13rf9LRCrQl0bw+jeMNhTwvO4+PCt4dFJh296ZZNj
         3nE9pIxiEh7v1Sqx6KqDmfrLz3kexDOZ9x9r7US4PbkCnRB8AtMoNV6veEgOgul8UCTV
         eoeISM8xgJk8k56WDm+FS1OjwfryN3NuSsdilWZJZFA0sK50AxpRDXA/IoH8br0p9JY+
         STNCirediNPiszqGNMeYu6BCIYY4ONbzHlFyFdelF2vHQegQ6zWm0GJEFOIhb86p1FrG
         MtGw==
X-Forwarded-Encrypted: i=1; AL+hErFv8PuTfDsHv/ygL2D86bSChfOVs9HQYpRqGC98SfDQazfMwq8GXZyZWSnxjCJOlptJfzliFypX8fRmNQ41J1Me@lists.infradead.org
X-Gm-Message-State: APuU4Z/S/NaK7uWmD+Jogy4zN+HskGp7X9HeFH91IC27AWjqruQvbdST
	D+t+73cejtUt+MxXFLZjqZc0bTfn0BcFxctgLKDrP3ukK6uqslb6uNjI
X-Gm-Gg: AYBFou2mOtOZP1byLkZVuz4KDlOWF5xA9Kt3o2yZ5WuPGKlEE1RZD0UV/zT6ijw60gv
	HHe7VmXqJIe1eEj9xf7kTxqm9c4AfFr1Ox5MhWipkkjc1Iaz78HX35E/mCWaPdqoi5Un8gJHTRI
	9ITr9/5s7BoapBchonTSXulyiaU9BZhazRZ9oHimTYG/55KlCXUf7X7awSx+zDj7wVLwXtDjYox
	uzJtAzSYiFZcS8Ozf8YHXzbP6d4S8CxZXOp2yOsqkICD+5b167Vr8YRvdzIF6f2I2qV3umBWB6/
	hJH/qJ7Puv3/SlLYCiCkwg09/1FXsbp9Q/vEh5nfQafIWJLKSKRrImlrKfSd+jfSTfHyTqWpVaV
	4rcyPf4nibyZAI3yM4Gl028mXGHV9kamZFtodHBn3bb2ZCHyl6P70IS/6ujCtHg9vARNszO1Phh
	Hs+3XmBye5j/nnNAVVE9vjKIHQ0hhkttHf8mJVuTlDCUDcEM6+ZiJ2MlPZFrwSOghtHcO/Pz/zb
	zlh8YHYCwamYHeUZbH3pvkL
X-Received: by 2002:a17:90b:5905:b0:3ac:9c37:942e with SMTP id 98e67ed59e1d1-3b0db70add1mr2802118a91.49.1793980871142;
        Fri, 06 Nov 2026 08:01:11 -0800 (PST)
Received: from hj.. ([163.239.22.29])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb70a7fbcbsm727930a12.25.2026.11.06.08.01.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:01:09 -0800 (PST)
From: hyunjungg <hj351016@gmail.com>
To: Sebastian Reichel <sre@kernel.org>,
	linux-pm@vger.kernel.org
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Hyunjung Ko <hj351016@gmail.com>
Subject: [PATCH 0/3] power: supply: fix work-vs-devres teardown use-after-free
Date: Sat,  7 Nov 2026 01:00:54 +0900
Message-ID: <20261106160057.2754689-1-hj351016@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_080112_910642_66026706 
X-CRM114-Status: GOOD (  10.03  )
X-Spam-Score: -1.9 (-)
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
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Hyunjung Ko <hj351016@gmail.com>

Three power-supply drivers register a poll/detect/charger-detect work for
device-managed cancellation (devm_[delayed_]work_autocancel()) in their probe
*before* they register the power_supply via devm_power_supply_register(). devres
unwinds in reverse order, so on unbind the power_supply device is released first
and the work is cancelled last. The work handlers call power_supply_changed()
and dereference the power_supply, so a work instance still pending/running in
that window touches the already-freed power_supply device -> use-after-free.

Each patch moves the devm work-cancel registration to *after*
devm_power_supply_register() (and before the IRQ/poll that arms the work), so
teardown drains the work before the power_supply is freed. No functional change
otherwise. The relocated devm_[delayed_]work_autocancel() still runs its INIT
before the work's first queue site, so no queue-before-INIT window is added.

This is the same class as the recently-applied cimax2/extcon work-vs-devres
fixes. Found by static analysis / code review; none is reproduced on hardware
(each needs its charger/PMIC/gauge chip and is not QEMU-reproducible) -- treat
accordingly.


Hyunjung Ko (3):
  power: supply: ltc2941: drain poll work before the power supply is
    unregistered
  power: supply: axp20x_usb_power: drain vbus_detect work before
    unregistering the supply
  power: supply: mt6360_charger: drain chrdet_work before the power
    supply is freed

 drivers/power/supply/axp20x_usb_power.c      | 16 +++++++++++-----
 drivers/power/supply/ltc2941-battery-gauge.c | 10 +++++-----
 drivers/power/supply/mt6360_charger.c        | 13 ++++++++++---
 3 files changed, 26 insertions(+), 13 deletions(-)

-- 
2.43.0


