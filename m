Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147D0606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 03:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RZA5yCiE;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=Q6WOl2/i
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=; b=RZA5yCiESjx+zLKUJrwG5WbJNm
	LPqd/Vf/2fR6CXz8kP//6MWSwPgTd7hYyD7xUtJnzlCb/GKOQLmhJ63wq/i9bZa0ZLdEPbQeCh2nZ
	+kkoWOFPNEk7+gsPLCXx2ivwPR4lpBGZZkkvkmgTqMiysOugPboGD0OA3PACwS9Bumc0Eul6tz2K4
	MIFgu11ixHmAAEjd0ltIuxqG2NKaYxA3ygm5NnuVK6KOf+oxKxiSHh4EYRboGlZHG5twRoKYjFK27
	6aNv2CMe4WEUrHleoMva5pSd05Fm+biMsnTASgKBChrw2zddBWdvOkaBBY112SLIoE0t0z54rZweY
	LFg85DXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFam-0000000DzSZ-0VSh;
	Fri, 20 Nov 2026 03:47:16 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUFah-0000000DzRm-0F8N
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 03:47:13 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3b3fb193c03so248014a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 19:47:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1795146429; x=1795751229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
        b=Q6WOl2/iVtrzkRmL9MyAd+ylM+/rFJgxR7UsDJnhk1Wzogq2DgHqkKmeN8PRWKQzYR
         c/Sm9p1I5tntkwv3FjjnfeHhdJ4UOZlcnca2E1FMZxVql7H2TiOxF3ykTj41A/l2x267
         NdHnbKrrqu10CevVIB4n8dG14hMKM7my6MC197T+ZVOqO0n/eO/6YUBBzmxl9sPRXs22
         IAjKqLMTOp89b6ne9KyFuOe/G0gDrHatMCTj4cn5N7Bo+em+aQP4EJ/qsuXMMrt4/4FN
         ZR0iWREbBmg3iichy1k/dWBYvr+NhIJQP52d3T95pqwhucHM6qK0lnSc4XnyYq193D9T
         99SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795146429; x=1795751229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gSE+vA5IN3RbWYU8j4MyYZZedbDvkUv3IVOfIgsxRUY=;
        b=Q4orfU1k3unqywmcTkFbBjFkzk3h7SCepOQTfYgyBdJkKBbARPVBSZs6wy4d9ZvlRG
         W8HJCbUGBUJVMdSbic4JeY1trj9D5iHZttFE7HZUfOUPVpb6F3njFPcP2iA17BAQHgjR
         CFwBpeJrB12mG/h93IrHpksPBnMf8eQFKzEexr17lAwktT0ymx++g4scMUO0KpvaCBoo
         m1iKxAfyw7WgiPdUyJk3kRraq/K8tPtAteZ8hxR/n7L6AXXaAJotBynvra+eNQT/7LqL
         NOkCG9snZ0Bj3OYGcaSPjHNvuiZ05UJEJ6v4OoYrQxkHhcPWhoNrPzz3U6gA91mEsinl
         w5HQ==
X-Forwarded-Encrypted: i=1; AL+hErH3Ay0Tncetp6uOrORNBzBSoCIeoafoMBwqTaJjtoT2nmhqF74be80n1+cNyRiIhOuSB6Db7HtNOrNl8zyJtY2D@lists.infradead.org
X-Gm-Message-State: APuU4Z9wrfGJ0VKrPlDg/VTGyeaRy1mXoFxrxVOTlRaAi6StzNVZApIQ
	egcLMcdHuKf81pZNmaDVra+9BhVa4fjAFYj1tqGmfzaAwtmh0lQa/E45VQcRcwTxNw==
X-Gm-Gg: AZFdTZcRuQSk4tT+AK3bKWdIjvVZ5beBtNZrl2ech3xUdRoIjSIIExB6fdqVi2QEzZb
	w90ZQwJnhwkqD7jS8lBiH3dICmDVZVvG1VtB68uNvUF+U1vI08JZfbwIaxXVOOY6k3cn7Bce/ZA
	xH2vCgE8fgoRqYEFwVz6Q3/wu8ZkR8k4tdldJNVCYaZhvFkarWBpg2brJal0VwfHKZauavW05oH
	YJ/eIGKloHuSaFqsc6HG4gfzpjQDkBKaP6wVLQRaLREIsOec9uw6yF+pmy6cRUdqq0KhadorU5w
	OmVjLkGirII59gAbQXJAtJ9hRAEvY+C1CPIyHJLLDgGYk4F0Kd4VulNqC64eX4LjPpi1acARFQp
	nqj9Xwnw5Y6cteI9Hb+YW+GbCk7oKCmoECiNf8Hi+xMqaZvDPVTV9R4sqNf7q07ttbZfNkGc5CA
	gkBSncmcrdKoEpZFoIYrJoTgtEhXqgR4hqxP/fvWoWGV5XrpbWjFex/PYQFj3VDmf+bICZnYCXK
	DMFFtc/+tOe72FMj4nn9AZ445Ov4qFzgnpCC2G0lshkI8iW9CXsXZ5hclZGGzvcf2yZusyK+EYP
	mUNsS3QOBN8rXGZKVyzKFilxQWxYMKtMhWpCqqSErb4ZcyHs4Y75h+X7atZn2TXySvdfUlXkslg
	hBdcQ7Bahb0xlVzBd3A==
X-Received: by 2002:a17:90b:5350:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b41c98bcf9mr1285768a91.13.1795146429308;
        Thu, 19 Nov 2026 19:47:09 -0800 (PST)
Received: from cantal.lan ([58.136.72.57])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40f4312dfsm3854582a91.3.2026.11.19.19.47.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 19:47:08 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 0/2] net: ethernet: ti: am65-cpts: add PTP_SYS_OFFSET_PRECISE support
Date: Fri, 20 Nov 2026 10:46:59 +0700
Message-ID: <cover.1795143925.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_194711_193187_0940ECA2 
X-CRM114-Status: GOOD (  20.59  )
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
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds PTP_SYS_OFFSET_PRECISE to the CPTS driver for TI K3
SoCs. This brings a similar hardware-supported level of precision to the
transfer of time from the PHC to the system clock as already exists for
the transfer of time into the PHC, whether over the network using
hardware timestamping of packets, or from a GNSS receiver using hardware
timestamping of its PPS signal.

The system counter of these SoCs, the Global Timebase Counter (GTC), can
export one of its bits on a push event output. The Time Sync Router can
route that output to a CPTS hardware timestamp input. The CPTS then
timestamps edges that fall at known counter values, so each timestamp
gives an exact pair of PHC time and system counter value. This is
similar to the PCIe PTM integration on these SoCs, where a selected bit
of the PTM timer drives a push input of the PCIe CPTS.

v2 drops patch 1 of v1, since it has been applied to the mfd tree [2];
it added a syscon compatible for the GTC register frame that selects the
bit. In v2, patch 1 adds a ti,gtc-push property to the CPTS binding,
which names that syscon and the CPTS input; patch 2 implements
getcrosststamp.

The series does not set up the Time Sync Router. Mainline has no binding
for it on the J722S, so for now a board overlay sets the route, as it
does for ti,pps. With Rahul Sharma's proposed binding for the router
[1], the CPTS node could select the route itself. ti,gtc-push would stay
the same.

Tested on a BeagleY-AI (AM67A / J722S), a BeagleBone AI-64 (TDA4VM /
J721E) and a BeaglePlay (AM625).

With this series, phc2sys steering the system clock from a free-running
PHC sees an offset that never varies by more than 1ns, whether idle or
under memory load. Since the PHC and the system counter run from the
same oscillator, this is the noise of PTP_SYS_OFFSET_PRECISE itself.
Without this series, phc2sys falls back to PTP_SYS_OFFSET_EXTENDED and
the offset has a standard deviation of 2.5 to 10ns when idle and 22 to
31ns under load, with excursions of up to 200ns.

When the PHC is disciplined (by ptp4l or ts2phc, to within 4 to 7ns rms
of its reference), the offset seen by phc2sys with this series has a
standard deviation of 2 to 5ns, whether idle or under memory load.
Without this series, it has a standard deviation of 5 to 12ns when idle
and 22 to 29ns under load, again with excursions of up to 200ns.

PTP_SYS_OFFSET_PRECISE has a fixed bias, the capture delay of the push
event through the Time Sync Router and the CPTS input (about 11ns, plus
an undocumented delay in the GTC), which did not measurably change under
any load or CPU clock. This series does not correct for this bias. The
driver similarly does not correct for timestamping delay on extts
inputs, nor for ingress/egress latency in hardware timestamping of
packets. It turns out that the bias in PTP_SYS_OFFSET_PRECISE and the
delay in extts timestamping largely cancel each other out. The offset of
PTP_SYS_OFFSET_EXTENDED relative to PTP_SYS_OFFSET_PRECISE is about
-50ns when idle, and moves by up to 40ns with memory load and by up to
60ns with CPU clock frequency.

The implementation was also stress tested by using ntpperf to load the
CPTS (-D 0 -M at 15,000/s and -N 0 at 5,000/s). No errors or wrong pairs
were seen.

To try it on a BeagleY-AI, apply this overlay:

	// SPDX-License-Identifier: GPL-2.0-only OR MIT
	/dts-v1/;
	/plugin/;

	&{/} {
		#address-cells = <2>;
		#size-cells = <2>;

		wkup_gtc: syscon@a80000 {
			compatible = "ti,am654-gtc", "syscon";
			reg = <0x0 0xa80000 0x0 0x400>;
		};
	};

	&cbass_main {
		#address-cells = <2>;
		#size-cells = <2>;

		timesync_router: pinctrl@a40000 {
			compatible = "pinctrl-single";
			reg = <0x0 0xa40000 0x0 0x400>;
			#pinctrl-cells = <1>;
			pinctrl-single,register-width = <32>;
			pinctrl-single,function-mask = <0x000107ff>;
			pinctrl-names = "default";
			pinctrl-0 = <&gtc_push_route>;

			gtc_push_route: gtc-push-route {
				/* input 11 (GTC push event) -> output 14 (CPTS HW5_TS_PUSH) */
				pinctrl-single,pins = <0x3c 0x1000b>;
			};
		};
	};

	&{/bus@f0000/ethernet@8000000/cpts@3d000} {
		ti,gtc-push = <&wkup_gtc 4>;
	};

I used an LLM coding assistant to help prepare this series.

Changes in v2:
- Rebased on net-next
- Dropped the syscon compatible patch, applied to mfd by Lee Jones
- Made a failed ti,gtc-push lookup a warning; the probe continues
  without PTP_SYS_OFFSET_PRECISE (Rob Herring)
- Three smaller fixes to the driver, listed in patch 2
- Link to v1: https://lore.kernel.org/all/cover.1794284248.git.jjc@jclark.com/

[1] https://lore.kernel.org/all/20260828100615.1700223-1-r-sharma3@ti.com/
[2] https://lore.kernel.org/all/179511436097.97786.7515300839199702588.b4-ty@b4/

James Clark (2):
  dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
  net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE

 .../bindings/net/ti,k3-am654-cpts.yaml        |  17 +
 drivers/net/ethernet/ti/am65-cpts.c           | 313 ++++++++++++++++++
 2 files changed, 330 insertions(+)


base-commit: 5b87a11b1547c39da01718044b9f99fd85948b9c
-- 
2.56.0


