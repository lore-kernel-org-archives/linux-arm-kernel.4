Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84B1606A332
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 16:21:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=vThCUhip;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=UJ7NTgBB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=w6xtuLM9HrxHujYVMQV7MBMbD4qoIrs9MPoeBowe9/w=; b=vThCUhipAyEZZOhtgt6mrIamVH
	GuYRQUOjkkPtc0/ayKIvT2DQtNEvo3HmLeRDBpmMDkb54EmnmT0D0G+0PkSzcfePtutaFapLbWIBG
	N3cVkztAy4/g7V7KiRbETQQSOv7GHMq3Db2hR8jYAET1qJoiw3HsIqZ5qw2j+C3mbpAZSrAKCuMnz
	+rybKkhsZPbGQXfrHBxnWBPJ7gZ0kmoK8+VnWEpCnBMF2uUJX0ULTFXjjuu78DIGRAsiL+1ZV4opV
	80zBJ/S5jb/tD04SN/KEtQoz8KtnK+x+oXesfsw/p1TF3lLN7ETS/LV8WytPOQAc0wmWBhb5gug+k
	O2gFqjBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFjx-0000000AXAP-0gD2;
	Wed, 25 Nov 2026 16:21:01 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWFjt-0000000AX5y-1mnB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 16:21:00 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a9a8d6cea8so77247465e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 08:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795623655; x=1796228455; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w6xtuLM9HrxHujYVMQV7MBMbD4qoIrs9MPoeBowe9/w=;
        b=UJ7NTgBBuDX/QWVBfBdK9dS05Yd99wMSCDRehfvxsC2EFORVsjBayhGFrF+JE7fxIA
         nrOZO/Rk/7u561AfSZSnS0rs+SNbpg3MX6ntKB8tlJhmTT3OXGfL0IxOoWq5dZCyTqgS
         nHbda8qx3gsQIe8Li+98F0y5Id/9OaLRiQHQEQwSipFEURChDepU7dCWqA7JGuUmfjdD
         MntP0J2ZV4jtGlwEXOvHZZh5UedSDU6H03KPR6KIY60OqFJbMKfBbbotwzdB7clQY67b
         NxPnnxrHG4dLbsDrsKiCTi0qr8HQ6hSy7eYzPTQP308v9XbtgNFBqg9oC0UCMDyWw8X7
         xUpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795623655; x=1796228455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w6xtuLM9HrxHujYVMQV7MBMbD4qoIrs9MPoeBowe9/w=;
        b=ceVh9JgoUAePvt3Mx5YBH+pgOMKu9DqD5LfyPuvLq2f4Q3beJbF5mKmq7LTQ6qoZmc
         tkO1mMpw/8CLw5582FLlDra8cq2tu2JxhDihvL2uByzBcgFkwMp2e5isglXUFsR27Ufz
         Tx6Iw1OD79mb3zzawodUMzw+ek3G5alAt+Rk2To74aFZNU4MOrhtpyPABisPi2TMRRBt
         14OMIb6h78qmyxtcVRt5ioWqUbDHrf8IEJdjqCslf7KL+nkZK0wQ7cO2BHWIhGpq0lQv
         uOh75+H/ihGvZM/NkCgZRP0tiPVi1pgPC74DWUohQRqP7FTMCi3PEJtP4yLetp0UB6w6
         GUMA==
X-Forwarded-Encrypted: i=1; AL+hErHyPjn1nXo+205Oy0HmIny6orN96H+NhJvuE+W52qS62nLtc2gE30eGXMCYwoXXNzXTwe1u2UekpjWv/yYCF8Kk@lists.infradead.org
X-Gm-Message-State: APuU4Z9x7Ys42BtvyxPTWs7FzXNjPZrQffo3z6fe/O+sFOer/pg8Jz+N
	OIyVKERMN/OrDDdki9a8qRmuJ73kqXiDiB9dTyzyXrS0PuwTZzHCeQX3QlIi4Pu+K0U=
X-Gm-Gg: AZFdTZdVlHt+riPsebVa8vx/P4h2M2E2xV4DRsXIvsALa1NH+YPnM5X5i2JonU49wr5
	tKJ3xMFzh87NHkLU8vTeic/31x9s2RCjdPrKc9aQv9kssZrViP/vaVAV/OKPhiSCVrVIYGZpG9g
	UgqGyTnlY16yioeCrRetZzkUBJz4xePqwgTF7IFqzhrymbIu/cbs45h8tMbujcv7b1FLCgB7ZDY
	cN88bCm5u7Br9LkJ6KBOksq30E77kT3HTaniB7TTDm9nzbXQmAQ0p9cDp1CLYRsx1tIy7jwgth1
	RNNcDLgjAAS/F61CEORa669eoomaualV8Rf0qAf/mr6QSRaLNzUBW2yoB4FpFXwzs7pnRPIJgWr
	5wY27JrqrwRIoMS2XEEYahLEsWgnInqecQ75ffi/pcijmOeMbYRmGitN+Hv7MMkzD/HDsBJEGqw
	CGPh9R7a3Hv4B8i3fc5ikInG4My3n9u5YiwyMKOT79C7L+uwFwtMSMtnFGBXWW36uxpBx4BWg5/
	56/g398jUkH0MSZjf2EFk5n2eS+gRycPD5Ydp47owmcB81DVn0z9iIg38HvHkVgVQHEISKjfMVm
	At6uVfIbjijAWXjRjfXDGyCSKQo+Vw==
X-Received: by 2002:a05:600c:4f81:b0:4bb:5e8c:13bc with SMTP id 5b1f17b1804b1-4bb88805902mr356474775e9.7.1795623655370;
        Wed, 25 Nov 2026 08:20:55 -0800 (PST)
Received: from localhost ([195.94.148.180])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906640a2sm288622535e9.0.2026.11.25.08.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 08:20:55 -0800 (PST)
From: Andrea della Porta <andrea.porta@suse.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	linux-pwm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	florian.fainelli@broadcom.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: naush@raspberrypi.com,
	svarbanov@suse.de,
	gary@garyguo.net,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	krzysztof.kozlowski@oss.qualcomm.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: [PATCH v14 0/3] Add RP1 PWM controller support
Date: Wed, 25 Nov 2026 17:24:49 +0100
Message-ID: <20261125162453.23573-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_082057_508084_8F07CA4B 
X-CRM114-Status: GOOD (  21.70  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This patchset adds support for the PWM controller found in the
Raspberry Pi RP1 southbridge, used on the Raspberry Pi 5 to drive the
cooling fan.

Since v13, the driver also registers a "fan" auxiliary device
(pwm_rp1.fan.<id>). On the Raspberry Pi 5 the RP1 firmware measures the
fan tachometer pulses and writes the RPM value in the phase register of
PWM channel 2; the companion hwmon driver, sent as a separate series to
the hwmon list, binds to that auxiliary device and reads the value
through rp1_pwm_read_tachometer(), exported in the 'RP1_PWM' symbol
namespace. This is the approach agreed in [1], and it removes the need
for any dedicated DT node or binding for the fan.

The DTS node for the controller is already in v7.4-rc1 [2]. The DT binding
has been applied by Rob [3] for consistency to v7.4 and is part of v7.4-rc2: as
a consequence, patch 1 is included only to make this series apply 'logically'
on top of v7.4-rc1 and can be dropped when rebasing.

Changes in v14:
- rp1_pwm_round_waveform_fromhw(): fixed a u32 overflow in the duty_offset
  computation when the period register holds U32_MAX, and return a zeroed
  duty_length/duty_offset when the inverted output is constantly low,
  instead of a duty_offset equal to the period, which is rejected by
  pwm_wf_valid() (reported by Sashiko AI review [4]).

Changes in v13:
- dropped the DTS patch, already merged.
- add patch 3, registering the auxiliary device for the fan tachometer
  and exporting the accessor used by the hwmon auxiliary driver. The
  exported function was originally part of the fan patchset. Since it
  is really part of the pwm driver to be taken by Uwe, I moved it in
  this patchset.
- Kconfig: pwm module now depends on AUXILIARY_BUS.
- added a macro to define the phase channel number from which to read
  the fan speed.
- removed the 'Tested-by' tag from Gary (see V12) since the patchset
  has been significally changed and need to be tested again.
- the controller private data is passed to the auxiliary device as
  platform data, so the exported accessor no longer depends on how the
  parent platform device stores its driver data.
- dropped the unused 'pwm' argument from rp1_pwm_apply_config().
- added a MAINTAINERS entry for the driver, its DT binding and header.

[1] - https://lore.kernel.org/all/ae9a4df9-b1f2-4f00-ab86-d9cf8d9bc387@roeck-us.net/
[2] - https://lore.kernel.org/all/7c437a10-985b-402c-b3ac-cfa97c53d014@broadcom.com/
[3] - https://lore.kernel.org/all/20261102192302.GA882027-robh@kernel.org/
[4] - https://lore.kernel.org/all/sashiko-outbox-231741@kernel.org/

Thanks,
Andrea

This version has been prepared with the help of an AI coding assistant
(Claude Opus 5.5).

Andrea della Porta (1):
  pwm: rp1: Register auxiliary device for the fan tachometer

Naushir Patuck (2):
  dt-bindings: pwm: Add Raspberry Pi RP1 PWM controller
  pwm: rp1: Add RP1 PWM controller driver

 .../bindings/pwm/raspberrypi,rp1-pwm.yaml     |  66 +++
 MAINTAINERS                                   |   8 +
 drivers/pwm/Kconfig                           |  12 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-rp1.c                         | 477 ++++++++++++++++++
 include/soc/bcm2835/raspberrypi-pwm-rp1.h     |  12 +
 6 files changed, 576 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/raspberrypi,rp1-pwm.yaml
 create mode 100644 drivers/pwm/pwm-rp1.c
 create mode 100644 include/soc/bcm2835/raspberrypi-pwm-rp1.h


base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
-- 
2.51.0


