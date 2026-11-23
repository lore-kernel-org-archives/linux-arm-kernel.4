Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6BB4606A33D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 15:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IdTZcV9n;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=K++sd7Ds
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=uzen249UIQm/8PK5gYDtm7rMzMeyssG43QW925C4YsA=; b=IdTZcV9n30kMg2SEdIdhKzpGl3
	5xuXzfZ5HSpt/3WrzxJ9Y/VxkI4S22uvftW+nn/I0wyMVJYb5hgR9Rcr4T1J7A8SaK06yoneocJM0
	79ZttFapUTBS/g0xiQ8htMS60FyEHSM35jcME0WDhrNIVCq6QPHQCza/Xob5cfbXI4j96rwsYe0kY
	eNgaA7yUwUgD8xz8NeyK60EQDbVP1APrd/pke+vVYAzGy5jxCNjRme4vTnjJRNijY55nhUa4Q/66V
	ZULqf1ACctAYViXVvLM+ixsir5e4YEdsUTyVFIgpBCDw7DSCHeAsTMEQsZ5BD7KRW5tIANUcQrJOR
	Rw65RXfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrM-00000003wRe-2X3Q;
	Mon, 23 Nov 2026 15:21:36 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVVrJ-00000003wQ0-1O5T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 15:21:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-4a214c5c4c0so32002125e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 07:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447290; x=1796052090; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=uzen249UIQm/8PK5gYDtm7rMzMeyssG43QW925C4YsA=;
        b=K++sd7DsB6ItLmWJk3nWm/0LTtSLnRrP+brNc23r5hzqRaSiS6eY3sORDxGHCP8phz
         pUcehP2g86L5wqVuQPrExTw4Ch7ILsbQA1CvY5oux8FPORNXN3TaFAzxH8ACRsusUi8D
         HnG34ONd36RaEtxK6F9TgDwiFdPKz/bX3beSYtEq/JxDLg/1Khs4BivYGojANDUiH3gB
         V/vMC/thoNYS+hKZ9K+HG8tsHGsR3OHks/g3UFvS04KLY5V1AbAJ5sMNVvv25tiOmiu2
         cBG22heVGbBZa0NcH9AazR4ZOufFSxazoqXejP/tD7s4RsxCZ//BJ/0ye4s7/nrAOk2M
         9zuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447290; x=1796052090;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uzen249UIQm/8PK5gYDtm7rMzMeyssG43QW925C4YsA=;
        b=1EbDwKkM4+UH8S5LYJeTiVCdYzn3LEF4r34rsDHT5jclq6hhPD415ZSQYrdEXxBW5M
         OfjV3/16+6ovGI5V32+2ExuvDhviDfMPNtskpzJaW+XgtXzw9TmvCVf1Cfbtyg7drEQV
         I44t5E0YP7doltDX8S4BfXrRFKQQJ8+PySlIFmJKYaUzZ/xugxndnvX+6LZiI4OaeIQx
         mR8GeTLYbJRqaJOfM0O12F4cg/QCKu29bM2OxDF/vXUElkNadodcFLz3f8104PwCaCQw
         wm9xwyrheR6CdwoAvbjXMaWgkaXfljljWYGADceKhhG0hQH7jpkyeLYCMl7XLOozOsBp
         Fu8Q==
X-Forwarded-Encrypted: i=1; AL+hErEnVjY4fh3ijP0hul2+NsaPbMNphRkt1Vv6MyN+MfMpgMERmdm1mQ+Gz+TmoTSzkKYnvX3R/O15LXRsTe8WMAO7@lists.infradead.org
X-Gm-Message-State: APuU4Z9G4TG+oOFiz7yWjzFd8UFDTW8qeIGQM+n1kbdw3w+BX77ZNQ5b
	rctP1DS2j7a554wYxpt5f7vRRV5aVlPCgPGWXZEEodJUAEN2DiY+Q3TDB1cQyEiU6NM=
X-Gm-Gg: AZFdTZek/57OY+mZDruuk8hk79fynt6G1u3A5eU260G7Lf4RmU4KbfHiAoYU+qIeoZa
	vmMjFn0CAkywUSbBrgA3N2w5p1EpW6G2ru4YbAeq/3BptAoY+ztur1Mha6zsIVeVqUtPGXwtXdW
	kIp7I78Xa/cQT4hbH6JnAu+vNDK30fH9/MDNXLwNtCovVckv0hWQJrZ/OPHPcq+dE8KmRoGLZUG
	xtsRD04ar+3tvaU2VotO9UjWyCyKg5WI6fnUPoF12rwNG+fSRzV/mOZ9u+SDN1TLO8drlgPgL5I
	e2UsVe+dEYBbtHys7m4u8jtdOgl97D6ykKfiDPEnIEkWusY0U55aPlzUdw7U5OObVFOkIcBdkvb
	9Bm3V5GENlNYzQz683i6R5jwzO/48LfWxuSFzQ9gP89ggjLh1c5YEkvvL8lxjqNKT7fnP1rxBSv
	P8OOYZPVEQvt25nbtecKwbJ5VVf+l4OiAtbnKzGwDT2asJo+SIaZaWGcJ47vP88MHz325qTua/o
	Y66TjfT+hejOhoT80Zl+ZhowgVcSlbG6Mczlhkj8MiSmQn9b1kg1j0+9Wa6OIs8SNnGigtkWarS
	W/KDuOewUQNDvadf08j08qCpSeK5u0aCRtl/qHX5B2vT+DdkCGM=
X-Received: by 2002:a05:600c:4f42:b0:4bb:5c5c:8130 with SMTP id 5b1f17b1804b1-4bb8881c726mr304536705e9.5.1795447290177;
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67f204sm26542178f8f.21.2026.11.23.07.21.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:29 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Subject: [PATCH v3 00/10] pinctrl: scmi: fixes and GPIO function support
Date: Mon, 23 Nov 2026 16:21:22 +0100
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPJZBGsC/43NSw6CMBSF4a2Qjq1py8PiyH0YB/RyC9cAJS0SC
 WHvAg5MHBiHf3LynZkF9ISBnaOZeRwpkOvWiA8Rg7roKuRUrs2UUJkUseDQYOWsJeA9dTD4hgd
 oiVc9OZ5osChkYoyUbBV6j5aeu369vTs8zB1h2MhtUVMYnJ/2+1Fuu/+eRskFT1WZK53ERZmfL
 qaYGjIej+Batp2N6sNJGf/m1MrZAsAkmU5Lrb+4ZVleA+JU0ioBAAA=
X-Change-ID: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.17-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_072133_386710_D8FF0C35 
X-CRM114-Status: GOOD (  13.70  )
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fixes first: a setting the platform reports off read as set, a drive
strength in milliamperes that is not exact was truncated on get and
could overflow on set, the protocol layer read past a
PINCTRL_LIST_ASSOCIATIONS reply larger than its receive buffer, and the
pins of pin-only functions were registered as groups. Then the drive
strength conversion uses MICRO / MILLI.

Then GPIO function support: mark the GPIO functions, and select the GPIO
function of a pin on a GPIO request.

Patches 1 to 5 are fixes for v7.4, patches 6 to 10 can wait for v7.5.

Tested on R-Car X5H with a v6.18 backport that needed adapting, all but
the schmitt and enable settings, which the platform does not implement.
An LLM was used to review the patches and to set up the tests.

---
Changes in v3:
- drop patches 1 to 3, applied for v7.4
- patch 2: new, refuse an inexact or overflowing drive strength in mA (Geert)
- patch 4: Fixes tag, patch 5 (v1 patch 7) needs it
- patch 6: new, MICRO / MILLI (Geert)
- rebase on v7.4-rc4 (Linus)
- Link to v2: https://patch.msgid.link/20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com

Changes in v2:
- patch 4: keep the enables value on get (Sashiko)
- patch 5: error out on a truncated reply (Cristian)
- patch 11: unsigned counts, loop variables in the for (Andy, Cristian)
- patch 11: dev_dbg when no GPIO function is found (Cristian)
- join the lines that fit in 100 columns (Andy)
- collect Reviewed-by tags
- rebase on next-20261112
- Link to v1: https://patch.msgid.link/20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com

---
Clément Le Goffic (10):
      pinctrl: scmi: report an off setting as not set
      pinctrl: scmi: refuse an inexact drive strength in milliamperes
      firmware: arm_scmi: stop reading past PINCTRL_LIST_ASSOCIATIONS replies
      firmware: arm_scmi: report the pin-only and GPIO flags of functions
      pinctrl: scmi: give no groups to pin-only functions
      pinctrl: scmi: convert the drive strength with MICRO / MILLI
      pinctrl: scmi: mark the GPIO functions
      pinctrl: scmi: report whether a function is GPIO
      firmware: arm_scmi: add an operation to set the function of a single pin
      pinctrl: scmi: select the GPIO function on GPIO requests

 drivers/firmware/arm_scmi/pinctrl.c |  51 ++++++++++++--
 drivers/pinctrl/pinctrl-scmi.c      | 133 ++++++++++++++++++++++++++++++++----
 include/linux/scmi_protocol.h       |   8 ++-
 3 files changed, 174 insertions(+), 18 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
base-tree: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
change-id: 20261030-clegoffic-pinctrl-scmi-gpio-48cfe014bb11

Best regards,
--  
Clément Le Goffic <clegoffic@baylibre.com>


