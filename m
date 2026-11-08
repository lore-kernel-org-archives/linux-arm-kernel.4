Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD4F606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Nov 2026 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ySa/V1UX;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.a=rsa-sha256 header.s=fe-953a8a3ca9 header.b=Iy4Plcjg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mmRDTsFTMdkB1knSlLyF6ragoIMpPyE7Nd3fqt3pBKI=; b=ySa/V1UXk/N2jm
	mwRe7OoUFYom6W+Zs0wY+B8Zsb3PfIc8jyFGY2CuhNI/k51Tf0ipmpLnxPBe7BDv1cHY1LmV7Bacu
	4hb7k9Iq/YjIj8IW5BCfZNt54ADvphLQOLkbvWsJ32PNNt82FN+gi/311BQiLcPdRrdX/2+nAfDmR
	f+esVNUDplgNcnM2+pcvwXF+iJsD0vE6AhpBPHn392UikAAOD9VJ2Kv5HbWv5dveFD7J5qan2R++f
	CKaiu8kU0FLKEIErpE2r1xhg5X7CsWHsCMPuDLk9Uu/Z8la3mp9c8mKdQaemRUzTUUejfKe+xPa5Q
	dPfM4Jgte6IY3UvxBZlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ6lI-0000000GRLN-2QgH;
	Sun, 08 Nov 2026 17:33:00 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQ6lG-0000000GRL2-0SYP
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Nov 2026 17:32:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: To: From: Subject: Cc: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1794159176;
 bh=mmRDTsFTMdkB1knSlLyF6ragoIMpPyE7Nd3fqt3pBKI=;
 b=Iy4PlcjgVuoB+Mvxc7W+ibv7BGsEFFpWGnt9fdrkHG1WurqgqHYuObsApfTbSFabx1tzr/sXZ
 ODPlSf6MLSsdDflmUvk68FE1UBefW6RKSEbO45Aj2NqftupAm57C5rT+FM7CNzKlQvBoMJ3HVtK
 ra6lGh7bH/BOgr+9HgtsXhB5QfxxbGnWRYT9Um0w++Dz4Na+osY48vzluqbb6RDSfigRHWrb0IU
 1zYgq9kGjw6VZt3t8JuiTIXsXNxfd6F0gaAQTdoYYAqQZj57WmjevhHoE3ZM1Jvv5S3QyT7UDZv
 FJjoao4ePx7WB0rV2P1fxF7BuwiyF6fIGdmdg5Hh+lCQ==
X-Forward-Email-ID: 6af0b240935e4de7801c9067
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.19.13
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Sun, 08 Nov 2026 12:32:46 -0500
Message-Id: <DMQ0CENBZQGW.L35BD1BXYE9Z@ubuntu.com>
Cc: <linux-arm-kernel@lists.infradead.org>,
 <linux-perf-users@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <asahi@lists.linux.dev>, "Yuvan Shen"
 <yuvanshen09@gmail.com>, "Nick Chan" <towinchenmi@gmail.com>
Subject: Re: [PATCH 00/13] drivers/perf: apple_m1: Add M3/M4/A18 Pro Support
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: <myrialsarvay@gmail.com>, "Will Deacon" <will@kernel.org>, "Mark
 Rutland" <mark.rutland@arm.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, "Sven Peter" <sven@kernel.org>, "Janne Grunau"
 <j@jannau.net>, "Neal Gompa" <neal@gompa.dev>, "Marc Zyngier"
 <maz@kernel.org>
X-Mailer: aerc 0.21.0
References: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
In-Reply-To: <20261103-m3-plus-pmu-events-v1-0-a8eb6c1139fe@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_093258_175898_D43001FC 
X-CRM114-Status: GOOD (  16.48  )
X-Spam-Score: -2.0 (--)
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue Nov 3, 2026 at 5:14 AM EST, Myria Sarvay via B4 Relay wrote:
> This series adds support for the CPU PMU in the new M3, M4 and A18 SoCs
> presed in apple devices. These PMUs have new encodings for events, along
> with larger codes for these events. All of these events are as Apple
> describes them in the various kpep files found under /usr/share/kpep on
> macOS 27. More events may exist, but we have no idea of their affinity,
> or what they actually count, so we don't include them here.
>
> These patches have been tested on my own M2 (t8133-j413) and M3
> (t6031-j514c) devices, as well as by Yuvan on their M4 (t8132-j713)
> device.
>
> If possible, the device tree changes should probably go through
> apple-soc, as this is where the recently picked up M4 Pro/Max dts are.
>
> Tested-by: Yuvan Shen <yuvanshen09@gmail.com> # on t8132-j713
> Signed-off-by: Myria Sarvay <myrialsarvay@gmail.com>
> ---
> Myria Sarvay (12):
>       dt-bindings: arm: pmu: Add Apple M3/M4/A18 Pro SoC CPU PMU compatib=
les
>       drivers/perf: apple_m1: Remove unused variables
>       drivers/perf: apple_m1: Support per-implementation event size
>       drivers/perf: apple_m1: Use macros for per-implementation init func=
tions
>       drivers/perf: apple_m1: Add Apple M3 Series Support
>       drivers/perf: apple_m1: Add Apple M4 Series Support
>       drivers/perf: apple_m1: Add Apple A18 Support
>       arm64: dts: apple: t603x: Add PMU Device Nodes
>       arm64: dts: apple: t8122: Add PMU Device Nodes
>       arm64: dts: apple: t604x: Add PMU Device Nodes
>       arm64: dts: apple: t8132: Add PMU Device Nodes
>       arm64: dts: apple: t8140: Add PMU Device Nodes
>
Maybe the folder should be renamed to 'apple_arm' or something like
that?

> Nick Chan (1):
>       drivers/perf: apple_m1: Support per-implementation event tables
>
>  Documentation/devicetree/bindings/arm/pmu.yaml |   8 +
>  arch/arm64/boot/dts/apple/t6030.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t6031-base.dtsi      |  12 +
>  arch/arm64/boot/dts/apple/t6041.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8122.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8132.dtsi           |  12 +
>  arch/arm64/boot/dts/apple/t8140.dtsi           |  12 +
>  drivers/perf/apple_m1_cpu_pmu.c                | 664 +++++++++++++++++++=
+++---
>  8 files changed, 662 insertions(+), 82 deletions(-)
> ---
> base-commit: acb925da49876e74b806ccd48a7518d2d3368e5d
> change-id: 20260929-m3-plus-pmu-events-e4010ab44135
>
> Best regards,
> -- =20
> Myria Sarvay <myrialsarvay@gmail.com>


