Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B418D606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 00:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iqLfZliq;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=HnJDYnPO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=9xXqglDy8469GWjwyD/Y8sAmjDXXr4pfODnkEj3WbFo=; b=iqLfZliqhmcRbirzrHWeVrLkNu
	O45BX8359g4Ye+GkAsYd4FNh54nOSJZ3Aq3gkXWJrh2r/0RWez3JicRFMr3ntLKtIln3ugyhspkh6
	GEANKtAsDt/ueJtv6s1ktqLcqYqVyrwdLnZf7LEtp0xMg6miuNJ1Xnu48PC8xRaqoqsfkoTD0hdYc
	7wC1yROV/CZoZ0JbCPUdXp2RML6eVD6/lyZcDwZ7qTSAutJg7KVmzty3VjNPeqNFbuyiE66Ne0PaD
	qZx+cYKNz2JuqaQ/cH8ukLpMM0wFPCb9fPNbPSNy8nijuli9sy8LRp+WU4OlwPR+lG8zabemowTI8
	RiiKgFhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0Wn-000000086qG-045p;
	Wed, 25 Nov 2026 00:06:25 +0000
Received: from mail-dy1-x1335.google.com ([2607:f8b0:4864:20::1335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW0Wk-000000086pg-3Ubn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 00:06:24 +0000
Received: by mail-dy1-x1335.google.com with SMTP id 5a478bee46e88-36a315ed211so6235611eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 16:06:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795565182; x=1796169982; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9xXqglDy8469GWjwyD/Y8sAmjDXXr4pfODnkEj3WbFo=;
        b=HnJDYnPOLtGfLhtyqa+ef+AyPEMEXc2r1EX7Ll9rOwsWBVE9c65EvIjI1kSrWJ4VEt
         D/YYNwhqcLHKJAlprL2CJMz8v1i0kCvl83vYLkE3xlROpPF3TpJyikpg/p9t+QOvCAXg
         G3DYydT2JS5byy+fDIT66FBu5aHvqW4rduCb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795565182; x=1796169982;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9xXqglDy8469GWjwyD/Y8sAmjDXXr4pfODnkEj3WbFo=;
        b=Y46L4mqJwe0xYAPR+DDbVY7WcGSRtFgwOWXRKB2miulSj0nRWrZmTU9hnOtmTHkH+8
         H3I8/Piwq8tJCEllMFbBoeWBPECIgncgeSgjWuUYkS/TE8vW6C2FEjVTEcg+mxPN11kZ
         NTpAGKhnBm1DRYSaen6rxHu+YErVc/FRVgs6ax0Vdm0Ti4tsWI8gF8Iv8OK7zVvZUlvL
         FAHBEl2jQH1LBnrM8ZlTvUhlgAponvB0QPE97zWv8CCxZqIxwyCOsARz3E/sDxzKWyqo
         3EIhjkZFomnCW1esRZcsSgDmGxiKgx3Lv6JUXPvTC9P+fQ6gkzOboqcIvLAnttfWZ0J6
         nwNQ==
X-Forwarded-Encrypted: i=1; AL+hErEpfBoO0OtaAMiYKqqjt1LXmzHUd+OXOe60OkwCBCnyq62YL4GHV0Dd657Yt0iiplXX3SEq2q4+b8MM7KF3CU0e@lists.infradead.org
X-Gm-Message-State: APuU4Z9FLy6QyWr+CpBce1PHmG+um1aaBUhR/4Hsbclz9BLG9nkFsdyo
	X9ol9FCg6D06c0vsaelReXqnRreHmGPCRkil+QcVXd2+wZb2PwZ2QNtoF3k4xSYa1g==
X-Gm-Gg: AZFdTZeUBDZSz99egj0QRd6piX/pOqsP2oLn2RyrReI6xcpeZjvmKbn9GWY5VR7lBSD
	0WMShVdUtKIuqjR7DtT4r1M0iruk4VBp1PozTLCgCxsMTSuf9qdIMonbO9x9wSeJl9/30A2VHnN
	s1at8zh0Y8tgQWwmRbf//7+DmixwuBY47FvwHEF6ZthlnM46maL/33i4jCou4jAXW4nCcWBOLMJ
	yZXb+9mSeO7wY/N5IaDENQNjCLd6l61wl62GerMI0rldiOxrnesMMQe5b0wFyAwA9eC92GS8QML
	aPF848F1CVx8nzmB8IWAukR3Xwrid80j0KcfSEKj6eMdXcVQLsYCaQUIQFx1ceeDN3VoBVOQwlc
	OP/mKliWD+wdS7c0OgeRKFzc4ZQq2cwMeiCX4IlrCUgGyEdlbkKWVbj0KSCVMsMuDs80eSWv7jY
	scFUPh8SlUqrZk4kET8WSIHs3HZpZVqsV/2vPNzM5r+svUqi/glb8c4ufFxP5H+unWqKQGDDymc
	3/OKxoWtngs4r7zym+43SRHYIA/pMGRhNEFiNWju/wxLsMPY+zuC7jjRC7SFidXnpgYNd+ewIRj
	Cic3gbHROiEfw2Gg4Sw9+arjMoOwf3G9h/BAx9sVUxlhJic3f9XB+PS+NUexEqHYjsIB
X-Received: by 2002:a05:693c:880c:20b0:386:ab85:a011 with SMTP id 5a478bee46e88-386ab85a718mr8876110eec.27.1795565181421;
        Tue, 24 Nov 2026 16:06:21 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ea9b:d8a3:ba44:2d0a])
        by smtp.gmail.com with UTF8SMTPSA id a92af1059eb24-1b556840494sm38314956c88.12.2026.11.24.16.06.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 16:06:20 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ulf Hansson <ulfh@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	=?UTF-8?q?Andr=C3=A9=20Draszik?= <andre.draszik@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Radu Rendec <radu@rendec.net>,
	=?UTF-8?q?Jakub=20G=C5=82owacki?= <jglow@google.com>,
	linux-clk@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pm@vger.kernel.org,
	Mariano Marciello <mmarciello@google.com>,
	google-soc@lists.linux.dev
Subject: [PATCH v2 0/9] google: Add support for Laguna CPM
Date: Tue, 24 Nov 2026 16:03:34 -0800
Message-ID: <20261125000349.3385325-1-briannorris@chromium.org>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_160622_904067_05227814 
X-CRM114-Status: GOOD (  22.90  )
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

== External Dependencies ==

This series depends on the bindings and mailbox-payload-definitions from
this series:

  https://lore.kernel.org/all/20261023235408.3063350-1-dianders@chromium.org/
  [PATCH v2 0/4] mailbox: Improve the mbox core then introduce the goog-mba driver

So this series cannot be applied as-is yet. Based on past feedback, I
expect the relevant dependencies shouldn't change much more before
landing.

== Internal Dependencies ==

While this series includes drivers for several subsystems, I deemed it
appropriate to keep together, because they're highly interdependent. For
example, clk, reset, and pmdomain share many of the same protocol family
details (CPM_COMMON_LPCM_SERVICE), and so it has proved useful to review
them together, to determine sensible sharing and separation strategies.
Additionally, none of pmdomain/clk/reset/irqchip (patches 3-6) build
without patch 2, and clk/pmdomain depend on the binding macros from
patch 1.

== Merge Proposal ==

Generally, Google Tensor SoC support should go through Peter Griffin's
new Tensor SoC tree
(git.kernel.org/pub/scm/linux/kernel/git/griffinp/linux.git), while
clk, pmdomain, irqchip, and reset have their own subsystem trees.

1) This series requires include/linux/mailbox/goog-mba-message.h from
   the External Dependency "mailbox: goog-mba: Introduce the goog-mba
   mailbox driver"

   This should be up to the mailbox maintainer to provide an immutable
   branch.

2) Patches 1-2 should land in Peter's Tensor tree, with an immutable
   branch for other submaintainers.

3) Patches 3-6 are independent of each other, but depend on patches 1-2.
   Subsystem maintainers should take these patches once the branch
   exists for #2.

4) Patches 7-9 should go through Peter's tree.

Alternatively, if the process is slow enough, we may not need an
immutable branch for #1.

== Description ==

The Central Power Manager (CPM) is a co-processor on the Google Tensor
SoCs, as used on Pixel phones. CPM supports power-management and a
number of other features.

The Application Processor communicates with CPM over a pair of mailbox
channels. CPM provides clock, power-domain, reset, and interrupt
services.

This series adds device tree bindings, DTS, and drivers to support CPM,
and several of the basic services provided by CPM. These services are a
minimal set needed to bootstrap many other components on the SoC --
e.g., I have a working proof-of-concept PCIe driver running on top of
this series + pinctrl (not included here). CPM provides some other
components not yet included in this series (e.g., PMIC, RTC).

This series has been tested on a Pixel 10 Pro XL (a.k.a., Mustang) both
as-is (plus the aforementioned mailbox patches), and also with minimal
additional local patches to get other components running on top
(pinctrl, PCIe, PMIC, RTC, USB), to prove out some more realistic use
cases.

- Brian

Changes in v2:
 * Move bindings to power/, not soc/
 * Make binding prefix/suffix pattern consistent (no LGA_*; put type
   first (CLK_*, PD_*))
 * Consistent naming for dt-bindings headers
 * Drop unneeded IRQ number dt-binding header (these were simply naming
   documentation, at best; I inline these into the DTS instead)
 * Drop unneeded reset number dt-binding header (these were simply
   naming documentation; I move the macro definitions directly into the
   dts/ folder instead)
 * Flatten clock IDs to a single-cell binding, as the mappings are
   complex; the mapping from clock to firmware-protocol is better done
   in the driver
 * Move more protocol details from client drivers (reset, clock,
   pmdomain) into core CPM driver
 * Simplify to a thin 'cpm_handle' for transmit-only clients
 * Support separate API to register a receive-enabled client
 * Move pmdomain per-SoC info from .h to .c file
 * Remove custom pmdomain debugfs 'state' (get/set on/off) file
 * Restructure pmdomain SoC tables for simplicity and readability
 * Simplify clock driver, to avoid memorizing rate tables and clock
   topology that is owned by the remote CPM firmware
 * Drop clock .set_rate() for now
 * Cc new google-soc@lists.linux.dev mailing list (pending MAINTAINERS
   update, separately)
 * Drop linux-samsung-soc@vger.kernel.org (this is historical, for
   earlier Tensor SoCs based on Samsung designs)
 * Added Peter's Tested-by only for 1 patch; the rest have changed
   quite a bit

Brian Norris (7):
  dt-bindings: power: google: Add Google Tensor CPM
  pmdomain: google: Add CPM power-domain driver
  clk: google: Add CPM clock driver
  reset: google: Add CPM reset driver
  arm64: dts: google: Add Laguna CPM mailbox array
  arm64: dts: google: Add Laguna CPM node
  MAINTAINERS: Add entries for CPM drivers used on Tensor SoCs

Jim Wylder (1):
  irqchip/google-cpm: Add CPM IRQ driver

Lucas Wei (1):
  soc: google: Add CPM over MailBox Array driver

 .../bindings/power/google,lga-cpm.yaml        |  68 ++
 MAINTAINERS                                   |  10 +-
 arch/arm64/boot/dts/google/lga-cpm-reset.h    | 175 ++++
 arch/arm64/boot/dts/google/lga-lpcm.h         |  54 +
 arch/arm64/boot/dts/google/lga.dtsi           |  50 +
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/Makefile                          |   1 +
 drivers/clk/google/Kconfig                    |  13 +
 drivers/clk/google/Makefile                   |   3 +
 drivers/clk/google/clk-cpm-internal.h         |  35 +
 drivers/clk/google/clk-cpm-lga.c              | 223 ++++
 drivers/clk/google/clk-cpm-lga.h              | 194 ++++
 drivers/clk/google/clk-cpm.c                  | 385 +++++++
 drivers/irqchip/Kconfig                       |  10 +
 drivers/irqchip/Makefile                      |   1 +
 drivers/irqchip/irq-google-cpm.c              | 131 +++
 drivers/pmdomain/Kconfig                      |   1 +
 drivers/pmdomain/Makefile                     |   1 +
 drivers/pmdomain/google/Kconfig               |  14 +
 drivers/pmdomain/google/Makefile              |   3 +
 drivers/pmdomain/google/cpm-power-lga.c       | 365 +++++++
 drivers/pmdomain/google/cpm-power-trace.h     |  80 ++
 drivers/pmdomain/google/cpm-power.c           | 458 +++++++++
 drivers/pmdomain/google/cpm-power.h           |  42 +
 drivers/reset/Kconfig                         |   1 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/google/Kconfig                  |  11 +
 drivers/reset/google/Makefile                 |   2 +
 drivers/reset/google/reset-cpm.c              | 154 +++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/google/Kconfig                    |  13 +
 drivers/soc/google/Makefile                   |   3 +
 drivers/soc/google/google-cpm-mba-trace.h     | 163 +++
 drivers/soc/google/google-cpm-mba.c           | 956 ++++++++++++++++++
 include/dt-bindings/clock/google,lga-cpm.h    | 173 ++++
 include/dt-bindings/power/google,lga-cpm.h    |  79 ++
 include/soc/google/cpm-service-ids.h          |  84 ++
 include/soc/google/google-cpm-mba.h           | 168 +++
 include/soc/google/lga-lpcm-ids.h             |  54 +
 40 files changed, 4181 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/power/google,lga-cpm.yaml
 create mode 100644 arch/arm64/boot/dts/google/lga-cpm-reset.h
 create mode 100644 arch/arm64/boot/dts/google/lga-lpcm.h
 create mode 100644 drivers/clk/google/Kconfig
 create mode 100644 drivers/clk/google/Makefile
 create mode 100644 drivers/clk/google/clk-cpm-internal.h
 create mode 100644 drivers/clk/google/clk-cpm-lga.c
 create mode 100644 drivers/clk/google/clk-cpm-lga.h
 create mode 100644 drivers/clk/google/clk-cpm.c
 create mode 100644 drivers/irqchip/irq-google-cpm.c
 create mode 100644 drivers/pmdomain/google/Kconfig
 create mode 100644 drivers/pmdomain/google/Makefile
 create mode 100644 drivers/pmdomain/google/cpm-power-lga.c
 create mode 100644 drivers/pmdomain/google/cpm-power-trace.h
 create mode 100644 drivers/pmdomain/google/cpm-power.c
 create mode 100644 drivers/pmdomain/google/cpm-power.h
 create mode 100644 drivers/reset/google/Kconfig
 create mode 100644 drivers/reset/google/Makefile
 create mode 100644 drivers/reset/google/reset-cpm.c
 create mode 100644 drivers/soc/google/Kconfig
 create mode 100644 drivers/soc/google/Makefile
 create mode 100644 drivers/soc/google/google-cpm-mba-trace.h
 create mode 100644 drivers/soc/google/google-cpm-mba.c
 create mode 100644 include/dt-bindings/clock/google,lga-cpm.h
 create mode 100644 include/dt-bindings/power/google,lga-cpm.h
 create mode 100644 include/soc/google/cpm-service-ids.h
 create mode 100644 include/soc/google/google-cpm-mba.h
 create mode 100644 include/soc/google/lga-lpcm-ids.h

-- 
2.56.1.831.g720f3f5937-goog


