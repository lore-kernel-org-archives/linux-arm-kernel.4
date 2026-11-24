Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7A9606A329
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 17:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=o5ybhB90;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Q6GuDX8M
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=; b=o5ybhB90QqD6Si7cMyyqvkDQHq
	W/srA1vOzBKoGEm9wyFQd70Q4d79wPqkeuBE0A8FyBiOiGuycRF8tbOF3wyUe5s/4T6WJHc1LJkhn
	0vIGvSvbikHDi1Vg/IwljG8WlFN8YP/tauLcJS3iBSUPTLGEkToVKb7IxmISLREXIr+Re+fWBZeRL
	b4PHYKsXbtuackW55y8yGknK/3lRmYWsGIO83bs9ecVYZkj+AWM19FwseVXa7a8CKTdNjowGviPPV
	PzbyLAlDKrqhPm/hnLH/rhOW7TXpYCpZHykYVoUof9oYi7iWT+gthIsC+jKpG1ztC6o0Mhhprx8tn
	2QAaQCuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuOG-00000007NBy-17jv;
	Tue, 24 Nov 2026 17:33:12 +0000
Received: from mail-wr1-f47.google.com ([209.85.221.47])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVuO8-00000007N7t-13B8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 17:33:08 +0000
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-491f34b4e0fso2239494f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 09:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795541581; x=1796146381; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
        b=Q6GuDX8MBmhf+A14j/D9CSixEeQuTYrJO0wCExejWRR67EnrK0Zo9fB18+muc0j5m4
         J+c8h71vu2tdKAmvOnvvL2CotmBOJ+7rYxy4zc3ERNpPnAnrCfq/Zr40iD1/Xsl5q1zB
         Pijtx8pGYsYzfL+gLySHKSw/nYHPV708640maCWG2PjYAnYwouCvqI0Ypvpl/QrJsHJG
         Xj/h1KpN9DdcGUxkwYF8nULuA2Unya//fqkQF6np3hqsum6rtLJYo+caVPnHupQU0aDe
         Br8PcorBGNXE0yLhABXlzymEh8rTrqFLxpmwRnHxplGjN4U5wWuTy7YNcbnbxtC28NfU
         fHDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795541581; x=1796146381;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SGN0CE6hboOJyWQIpluS979Wc6QFsvjzK1IJ9fJlXFk=;
        b=EDvtBh4BLzr6TeWU0apV9KD39G3jsX4mfPAAwutMOAGlNheu1zbKkcv38g4kJyEpJD
         H6V2RG51bbmFPAjPb80qd1jU2dO73fTHwd8wT98OOFxyPk0ezgwMGyHqvcZFeDF7wcK2
         AGinY06CiFq/sORehNrrnhjaeTG7Z0TI+VemH7KcKn9ojJKsn+ko+S8RWrfh1so5Uh6G
         XdehhyRI8ry1DfdhcC0eOaPKZ6oCWWv0Ux/tU02bK8OeaIAWaJo7G5c3VcB6cCK65dMw
         PPk6wfxIHOSw/8te7e9cIlb1nezScK7NlAOcX18ydy+hRCOW0onqR8Q5gWnnIncm0AlW
         F8KQ==
X-Forwarded-Encrypted: i=1; AL+hErGGnH/3VDxTz0qm+nJn52cjbGHM0u11wyovDy22xZX69wl10j4YDCFMZ969qGlytFLa2SC47VkKM7WtuJXNbIIv@lists.infradead.org
X-Gm-Message-State: APuU4Z8yKYWcUdJ9pLk0TNWzTvbYcfZ4US9BXvB1BzEIpTjCY4+tLz7G
	twVJ805sD1/P5+/XZJH8Ww9dKU0+t/L9cLHx3sk1OrOHqlFdB9S+wcV3FHxFcV1ryEQ=
X-Gm-Gg: AZFdTZdmxVj/1GTe0PSSZoIxawwqAv9av1IQgPaTiQ7c7SOImYiEVcaFIRTmP7c+P1i
	fqPQA2hbEnArqabWZ751Q0pBOw11Y9WzE6BqUA/BtDmlSLOB00FSYZIGvwGNSdbslSOGjD2vUn5
	eg/LcYYXa+L+5G/s6BAics5hxcsqdol9u1tSUN7cAt+AHblJUBI0p+BjlTc4TVR/ftJCo5n0MTm
	XK4dvbsGwsFrHu/1LzJ6RBKku8eRd4T2BXW+kXjjkymNzdVEUboJ6sP+MOqdYNPoVFEswZsoLSi
	8YNXEuDANxbCCI/KeZczu6EHGosTqa1ABKa3/jozu1hFl0ZO+pdxPnb9TI+4/2DBB+BENuaLNEo
	oKpL1OKw4CGlXn7qXhgj3p/972TuHybqMSTp30DwBpfSOr+xWEz8bh2U+LJFnfrGT5b5oPUcRox
	ZveJWgSZJHo67MLj/3m0E60LT9j6D6P+kUcynkb1HHZ2NoRt6vaPp0qRbrI8U8a+kDUClRL9fKC
	8AxL1EWRVTRPhawPDpQW3XFxlgHwJCk+lbjqguNul/Gg4TxwFGNKXHBZdvg4lIZJvGDRVYtYNAf
	7qZxaPFrXZSWQRJxoxlUKtYqRXU=
X-Received: by 2002:a5d:5d87:0:b0:499:9f62:d64c with SMTP id ffacd0b85a97d-4abaf64be07mr33775504f8f.10.1795541581121;
        Tue, 24 Nov 2026 09:33:01 -0800 (PST)
Received: from localhost ([82.192.120.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989e3sm29248480f8f.52.2026.11.24.09.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:33:00 -0800 (PST)
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
Subject: [PATCH v13 0/3] Add RP1 PWM controller support
Date: Tue, 24 Nov 2026 18:36:54 +0100
Message-ID: <20261124173658.31030-1-andrea.porta@suse.com>
X-Mailer: git-send-email 2.51.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_093304_304903_19B2FBEF 
X-CRM114-Status: GOOD (  20.53  )
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

Compared to v12, the driver now also registers a "fan" auxiliary device
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

Changes in v13:
- dropped the DTS patch, already merged.
- add patch 3, registering the auxiliary device for the fan tachometer
  and exporting the accessor used by the hwmon auxiliary driver. The
  exported function was originally part of the fan patchset. Since it
  is really part of the pwm driver to be be taken by Uwe, I moved it in
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


