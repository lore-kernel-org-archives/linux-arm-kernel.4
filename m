Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28EBC606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 18:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F8ifO7YN;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=P0YqxNVn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=rewy0ibnC08oq2JgMwkp6Yjf6IPGQzWpE7cWP71uC4A=; b=F8ifO7YNmRb1pk
	Bz39PEpdq7P/OSk++Vv+ytFWZ9j4zuZ67LJ2UcMRFJS9oUIu9/zZy1fcJvgSVruAQmWOWzCq3jmtP
	mUrlqD4G7qtchLgbuh/Rsm/u1PA9OnWav/ZHu682cT2wgdwRFOGnuMqMKivk8f+yZNGHTTrF9ruGk
	onNv3/tmlDHOYQqAbpUct4K/K0iNfkm/SefqY1SuFPGthndaR7i6+uTFzNgjW/ZreUg5aAIx0GIrl
	3tQbvKXfbnpFg8bVmlrTd7Arc69fFkJgnEtGD472Ng9onXowWJECGyQt6Xb9/nRjPnsHNhu+lh5ZR
	fifk0S7mZuFv5QLISj4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Td-00000003Z9v-0hgg;
	Mon, 16 Nov 2026 18:30:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1TZ-00000003Z84-0lXm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 18:30:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EBB2042D54;
	Mon, 16 Nov 2026 18:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CA441F000CA;
	Mon, 16 Nov 2026 18:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853844;
	bh=rewy0ibnC08oq2JgMwkp6Yjf6IPGQzWpE7cWP71uC4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=P0YqxNVnx5vn5/8mPynFjKI5U4UXVy0i7s8C/pXqxjLXXIUgBMq7kbUqrreIsoza7
	 4RVaC05Cb+FplNTDYXP48vA01lCb+xeKmp3qCfMN2jZy1GCT5CBIw9vy0Kr0R98aPa
	 VB+b71Wm33eUVnyH6eZXtR/BaNXpq8OnO++deZ1mw+0CC0arHgb327M+4rLUqAjnGh
	 tMawlrMNzwCNYpCXxmgoQvDc2t6RFx/4y28Z4nfoqn4zJJLSeZSjtZQVYzxHZh34xO
	 wU9HlRBvYTwI/ZtzlQMDB4DavtvkYfgzw9AMyM4CyMX/rroKQVqC78zNhZXR6pC+XD
	 Wxvejlet+XZoQ==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Linus Walleij <linusw@kernel.org>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
Date: Mon, 16 Nov 2026 18:30:37 +0000
Message-ID: <179485376698.1193522.16982734764156586093.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 05 Nov 2026 16:34:13 -0600, Rob Herring (Arm) wrote:
> This is a batch of schema warning fixes mainly for 32-bit Arm, Ltd
> boards. While all these are 32-bit Arm fixes, vexpress-v2m-rs1.dtsi is
> included by vexpress-v2f-1xv7-ca53x2.dts which is 64-bit platform. Patch
> 2 fixes the last DT schema warning on 64-bit Arm Ltd boards. Yay! For
> 32-bit boards, this cuts the remaining warnings in ~half.
> 
> I verified the config-bus devices still probe after moving 'mcc' node
> with arm/vexpress-v2p-ca15-tc1.dts on QEMU.
> 
> [...]

Applied to sudeep.holla/linux (for-next/vexpress/updates), thanks!

[1/7] dt-bindings: arm: vexpress-sysreg: Add "mcc" child node
      https://git.kernel.org/sudeep.holla/c/cf8e899d84ab
[2/7] ARM: dts: arm/vexpress: Move "arm,vexpress,config-bus" node into sysreg node
      https://git.kernel.org/sudeep.holla/c/f23b85b795a1
[3/7] ARM: dts: arm/vexpress-v2m: Move regulator and led nodes out of bus
      https://git.kernel.org/sudeep.holla/c/f0d311aa312f
[4/7] ARM: dts: arm: Use standard node names
      https://git.kernel.org/sudeep.holla/c/e7c38fdf57c4
[5/7] ARM: dts: arm: Add missing "#dma-cells"
      https://git.kernel.org/sudeep.holla/c/d2875dd198cb
[6/7] ARM: dts: arm/vexpress: Fix Cortex-A15 GIC compatibles
      https://git.kernel.org/sudeep.holla/c/0c135a68ff05
[7/7] ARM: dts: arm-realview-eb-mp: Move "pmu" node to top-level
      https://git.kernel.org/sudeep.holla/c/ce28870a8e60
-- 
Regards,
Sudeep


