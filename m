Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5D3606BB1F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 04:24:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=BGLkI+IQ;
	dkim=pass (2048-bit key) header.d=jclark-com.20260707.gappssmtp.com header.i=@jclark-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=GLFe36Nr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=KtQ7MYeLVAuI+S3wrzryY9ksbyCrYV9o4wIQkIktrO4=; b=BGLkI+IQZsYQssGL8KlV870ESD
	9ivH41nxuBND355Ll70yJENcCyHQc6t+H6UbW4ORfaqudjBMJNo84BcilpGX9D28Vnm7jq+yTQkwm
	KSQwFKINs5hmcNZyVD6cc2LjbeTBC6A5C9m4CFQBrivhVan3mmbD/JysYDj7F13H54NUfjl4NGCCY
	3LDjsvXEOM14bseTKFfmtEeT+rH/AjhGWF0sy1K+YKFTac+q/BoqVwPUnfbLOi+cxTt7ZiNQRdkWL
	7FiDF8+TOsrxf/HkxadntiOLi5zfLq+Kzp8j2mNEjoIUfeR62W29TOXCDKTjxcd/Aob2j3x4iUeDz
	7ITXIguA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdP7-00000002Niu-2lGE;
	Tue, 10 Nov 2026 04:24:17 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQdP4-00000002Nhq-0lMU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 04:24:16 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-372bdb942dbso2198026eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 20:24:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jclark-com.20260707.gappssmtp.com; s=20260707; t=1794284652; x=1794889452; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=KtQ7MYeLVAuI+S3wrzryY9ksbyCrYV9o4wIQkIktrO4=;
        b=GLFe36Nr1nmNaw0NPAB6s+Ire5/ljDn1XMn8QOJKTQiRCU8PnZIoNN4mCqAO9ae4Uk
         cspqgjaVvF93N70OY2QPTVq9nvtvIGDcbO1jeF4tsgMaa5o8hBW8I8FljlZQ9SodIDVM
         Yh4fzRHFIJsFn1ynDQxicbT6U4qNVJFVtORBxzAOgGl3HygYPv+srksY6Dcxz9wOZB71
         wlVS7WnHZIYwEIjbOLA0k58bHgTc2/Hp0bJHhklLpGmLZeSwlzKwsSgpMFF2ZXnHgJOS
         FyMZ/eBabN4GUzKLq+QJtAD/xSfexx5ZH+kbKI7L0Q26cLMmtj5RFL+NT1e28u24NMj4
         wqwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794284652; x=1794889452;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KtQ7MYeLVAuI+S3wrzryY9ksbyCrYV9o4wIQkIktrO4=;
        b=P5fxl+1BoWaWzv15I+3bASpgUscSuNRCtFG2QQBn1vNoGnG4/oxFVuyHxizZsj6kGk
         tsOjOxjX7DIgda30w8pxa+QRCSa7RSwSSCVBLplbQu0kOpfZfZi5swtXKK28xFNPl2dJ
         sVZvtuzTGaqJ9zjvCT6xXqor8oH3b9jw/d5CP8q3ZWjHxJFBCHTL9DtPRU+kWuNNX7EF
         iUCYOjjOjbuhBjDUf23Ud9YwiwAMBdinlgCphTOM1fCAAm3K4+h7h5v/gJs4qry8KHGd
         QhM5sIMbmWvvSrFhNidzwwJXA0UfLqmIKGs2Q+F5DWy6q4F4upMFLV+/jFLWThs3U3Vz
         o1mQ==
X-Forwarded-Encrypted: i=1; AL+hErGyy8Td78woK0fGG+ePoybACjoqD6uPV38JJXObP0OAIRsS6IOElRXRKSpX12be1iff+/a5iOR/tZQojlUhNCsE@lists.infradead.org
X-Gm-Message-State: APuU4Z9dM5PCssMwfehBZrpnSGxg45XdA9Vlq/6Bn0oypGDXAwzG9jEa
	9ljr0G2b0lZkPLlrgUej2zQTCy2umuPHNK3vdRnk5vopyXpGnGow/vxRKXcMfpStVw==
X-Gm-Gg: AYBFou1C1RgSopkXeolzfmRyvDRObmy+wxEBw1RmMLDSM2yj/eoIFbsgIYEZiajPP2q
	ZaYBUCLsonf0frNgpiG37vDjJtG9qbG32MslFoRBagOad9kUahJcSjiYyUe0blOMZoH5M7cXWrY
	u0vZ1c6jcto+zBgBtJEzoo2QzupUM+Sw9b/+kzs6mZTIsbPpHWe+5IOqndS46ksTE73wFphBO0a
	73cXNqTgmMy0umm0PMJm9fl/FogLgBPpm/sGEIs89egLbvLhk5jzsnUx+HUwiyoOZXIuK+BKMWQ
	jfbGVDOmhr5oIB8oQBuOoIpkC7gRDz6K0DPRnqijfSlJ/nD4CHRiu7goBECS2VjMiRB1u9W1XNm
	g7u5Y5mvKGR3GJHHW/jiEpwIgutrXgUY06cDJ8PjiSUsupUSjiGg6/lSyK/GxYX3Yj2lZzB2bGs
	pNk+7RxjOAYjobPk9WdVxHtkfw/1itivnofbQfAbalDySanOpG90e1yjErVBv8gnwvpuFL/I0/Q
	FC5kFpUVnEPdTUWTqQG0vVEFABkMXD9MgcWALvo+PINizh6cQmwrClXXmn2g4evo9sbmvXJB8m2
	2r6HhYp1ErGy8l3g9cULsxCp3aeelxVE1K7hUsjga9sDh+QZYvl1RsuUMqa0e9cQAblJGZpj0Jl
	7YaqeLwItpnxAq5+8
X-Received: by 2002:a05:7300:fe43:b0:360:d4c5:7243 with SMTP id 5a478bee46e88-3751ee7bee3mr1721070eec.11.1794284652163;
        Mon, 09 Nov 2026 20:24:12 -0800 (PST)
Received: from cantal.lan ([58.136.75.91])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe32276sm3116950eec.8.2026.11.09.20.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 20:24:11 -0800 (PST)
From: James Clark <jjc@jclark.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lee Jones <lee@kernel.org>
Cc: Siddharth Vadapalli <s-vadapalli@ti.com>,
	Roger Quadros <rogerq@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Martin Kaistra <martin.kaistra@linutronix.de>,
	Vadim Fedorenko <vadim.fedorenko@linux.dev>,
	Rahul Sharma <r-sharma3@ti.com>,
	Robert Nelson <robertcnelson@gmail.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Chintan Vankar <c-vankar@ti.com>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	mfd@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next 0/3] net: ethernet: ti: am65-cpts: add PTP_SYS_OFFSET_PRECISE support
Date: Tue, 10 Nov 2026 11:24:00 +0700
Message-ID: <cover.1794284248.git.jjc@jclark.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_202414_486681_18130E2B 
X-CRM114-Status: GOOD (  19.13  )
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

Patch 1 adds a syscon compatible for the GTC register frame that selects
the bit. Patch 2 adds a ti,gtc-push property to the CPTS binding, which
names that syscon and the CPTS input. Patch 3 implements getcrosststamp.

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

[1] https://lore.kernel.org/all/20260828100615.1700223-1-r-sharma3@ti.com/

James Clark (3):
  dt-bindings: mfd: syscon: add ti,am654-gtc
  dt-bindings: net: ti,k3-am654-cpts: add ti,gtc-push
  net: ethernet: ti: am65-cpts: implement PTP_SYS_OFFSET_PRECISE

 .../devicetree/bindings/mfd/syscon.yaml       |   1 +
 .../bindings/net/ti,k3-am654-cpts.yaml        |  17 ++
 drivers/net/ethernet/ti/am65-cpts.c           | 289 ++++++++++++++++++
 3 files changed, 307 insertions(+)


base-commit: fa5196392691051963726787944db872420dfa75
-- 
2.56.0


