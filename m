Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C40E2606A326
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xiVzzVLB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bkb6m36X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=00kovWLRB5mU3CgTrku2HDMcvSM5rYFHby1xKMT+4ZA=; b=xiVzzVLBv8Hhnp
	eONos8ttPr24+gYGIjuwnmczz2dur05HhUbAfrsUpcui5RqCXF3FwClQg67JWePNreijPuNG8YjMP
	wM9wqTNqPHSAb20e1gKYuGnOS07CSjTNQDdRhg8vBQ0UcT0DyWuXlSJm1Vud1UTSDtt7B1jIgYeq2
	tqrPQ7z0g1AXslsDnX6s2rxaXoCBh/zII+g9JrV7iMXWuNgfv48hB08CTaxMMzffXi0K9iVESF1//
	8ArB1o57FwwogDFdH40hZbIFojI2z2RDQMH2lcIny+0NBTWc8Lycld5JIUgHTS7iICjBOAGGlM3K8
	BPRs1AMlu00yT/1xY1Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9dR-00000009MlJ-37dK;
	Wed, 25 Nov 2026 09:49:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW9cx-00000009Mdg-2v99;
	Wed, 25 Nov 2026 09:49:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1DBB40131;
	Wed, 25 Nov 2026 09:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE4F1F000C0;
	Wed, 25 Nov 2026 09:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795600162;
	bh=00kovWLRB5mU3CgTrku2HDMcvSM5rYFHby1xKMT+4ZA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=bkb6m36XwqElmmdgvWh48LQ8cYvUE9yizrdy/Hv0orBIxi17IupuLJ+xWcwpRX2yf
	 lqZ72h8XbM6NvF5tdJJX+uHA0AMJpS8oztAPagiyy3JSZoGGPuVdKIQnB0znNM1DAA
	 Hg2Y5MTfptol870TvCbEQxSRrltn9uRrtoqoDDJ7InwsROCvo8NhgpsN8ostIwtUAm
	 P9Vh5CSkl8wHakaiazTm2DFFAs1dzLz8TCfVCP8+jq3Hg6H0NFVBVVyNAaCGwoVoDq
	 mnrwugtmNTse54crHfUizVjvOcj+5m6/dcCVmyjDQYbpmLpj8zuOlKm6baUPCV4RZC
	 WzBdlFbtN8WYg==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 3/8] dt-bindings: arm: rockchip: Add Luckfox Lyra
 and Lyra Plus
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jonas Karlman <jonas@kwiboo.se>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261122060114.773624-4-jonas@kwiboo.se>
References: <20261122060114.773624-1-jonas@kwiboo.se>
 <20261122060114.773624-4-jonas@kwiboo.se>
Date: Wed, 25 Nov 2026 10:49:20 +0100
Message-Id: <179560016006.14607.17784216803858338533.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-22 06:01 +0000, Jonas Karlman wrote:
> Luckfox Lyra and Lyra Plus is powered by the Rockchip RK3506G2 SoC,
> which integrates three Cortex-A7 cores, one Cortex-M0 core, and 128 MB
> of DDR3 memory.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

