Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2B3606A327
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 17:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RcCCxiCj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CyB7N4Z8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=; b=RcCCxiCjf2tkcm
	519hjXVlZcKy+J2SUR0lEpD+VzVUOaQkq6GWFDR4+3wX64LQ05NjSwJGe1f5GrYrHFIAM2KKC4qQe
	I1ikrMEvwQlHu//4G7Us7UMg5SkWy+ZLA6t1rJaPOGSl7UrvRK3DnOaZlWbEeICOW1S6MOtlOpG0g
	cLFys/I1hZvQS9v9qGdKfKZI/SMkvJT/Fr25gW2NGr3oPqMXxtsWpvGhoGLfqcVvnMRX5BZdVoI15
	10GoozNBkcEgr364qC+aToiTnT4mkwK4vt+mNctjT61q3hNOApsLcnWrgYZMdqSR5Lhxow9WqFALN
	fEPJ3c9flZWj8oNSYN2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY4A-00000004P2b-2JNt;
	Mon, 23 Nov 2026 17:42:59 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVY41-00000004Ozh-0W0Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 17:42:53 +0000
Received: by mail-oi1-x234.google.com with SMTP id 5614622812f47-53c156ba662so1990372b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 09:42:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795455768; x=1796060568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
        b=CyB7N4Z8PNvZKk0guqzW9W4L6iUXLNr73jz8/GsMK5D6v+Pc06Qlz0dhSrD4bg3i1s
         KsWeNrU60JIVZV0ZkXkBnqSuR1tSKvtc4sV5S5T/RA/j/P49gGhJt9k9iA4ome4ME9n+
         sG3yKgB9GlR3IQtJIJqHR76BAEPuLSuZ/ecPtL6i7MH7aLNdKvQHgXaBGzUXUJZ2SDFG
         rCYL+9aQd5XD5zGMNnMao6Ots7fWl8FpGvwDTgM25B6BW8v1phqERUituhjilXqZrwdV
         QfTRp4T+oxut7fhEPVy4hJHq8GoOghdrsX11VG74iNxpKwW6iKWlRLH55k0bYDii4cQ/
         lBgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795455768; x=1796060568;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stSeoWTVSoG7vClTM34jNRVTmfdv9ae2mpsLHUuBopA=;
        b=RtBIIqj4hL2IsnG3WJTXwqId1vbxM/xGbKLW5QiMTXgnmkfxC9Dti+oXhswbAUKhoY
         hDQcriYpT/YhoxRamHhoo0q/ms95RfheHM1ytKmbo2alMJRgS2Wk07JTcplSLAYAchW8
         URtMggd5HS8nt7GHqFDTS6JnI/jV90aE3Mg3cN11Nuabdp4IWYnFeUuWE2RvnnWH79Gt
         hHRC9SuJo7T1WOdMPOozRSFNv6i0Zmj+GqjIA+DnyTACEGlgyqc+bA6hahpqiUMkstaU
         WIYYulyN53AfbL5xfIQRKQxfIRAgOULQht3ccuK2Qs2YHukwtvNEIKI7JnMDlKfZNjVT
         /Mpg==
X-Forwarded-Encrypted: i=1; AL+hErHdM7A65NvsXY+8yWLcXnd1p52mN0Kiw56W9g8U7ayVDwWYkuWH0YKOKcMRrrUtin/skbkTeeSEJ6Iqo3B2GQuf@lists.infradead.org
X-Gm-Message-State: APuU4Z9wDkFf/EieGbD/02/8+NiC78XKPWJFhzzySaMeY/fJaKIVQBd0
	xfqjWGrXlberzSi4i7OEOijfu6OhksEfeZ2l1IyHayOHSO2DB1gupk0T
X-Gm-Gg: AZFdTZcETa3pQzVQ/3P7olQeVWtgG41jYSwRm9cne30HZDk4aIBWkBKi28Flch6H1Mh
	WnGrBzwfBvn//KtzyjUv0TSVsD61pBnC77rodXV186Wyiabq3wJCJ5IxlTttFBiKzdt0hyeal3e
	To1ML2ORsmDle8iUDeMmFG+I/I6r5zSoCboxIsPLTLVIlyrTSQSW3bLZgfHayTyJMo8UYsqGiSv
	Uq+QhTwDcImJ7G9n2Ln3fZ/CBX8slNoUJyn3VAR6z4Bvi249B3lprX9IzKV8SL38n8aFU8JxKXR
	TFSSKYqXebdz9lidy3eE6s/+0yDHLTXfuKNtfdD8JD+hbC4BenFBH0R4KXvy6+tl3Y3b9DWZs57
	90cd376elD9W1m4VlX9cpmHt8uRM6oUYtXVI7RGJBwow0OGEvp9fGHnQ0mhswuCQZ0jPQd3D69i
	zDYFPvbFrlh94DcpS4bPZlulmzA/witCiL1HifjqhXKs+IJo/n0CZljxYYo0tv73eTKgItb6T0J
	lm3G7NtOLTfsRoIFvPmKu7Ht+Gg0HYzHTu4NLoaofKV7I7a23mAoDRZJeLWUw7Lq1Fu87tyVm6W
	8uB9pzLJ6OZ2LFNkIldadZ9kzP0BdE/KWr/77RsIDsPsWHNVWQqQBGX2gcBB85ADiakab4nSH55
	vS7vf
X-Received: by 2002:a05:6809:747:20b0:572:8a:59db with SMTP id 5614622812f47-57a742be1e3mr7669480b6e.25.1795455767809;
        Mon, 23 Nov 2026 09:42:47 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-57a3485e3ecsm8959220b6e.9.2026.11.23.09.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:42:47 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>
Subject: Re: [PATCH v4 2/3] arm64: dts: allwinner: add A733 SoC description
Date: Mon, 23 Nov 2026 12:42:45 -0500
Message-ID: <20261121-a733-dt-v4-2-reply@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121112312.75ba7299@ryzen.lan>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <dbfb7c5ea8b0ade2d48ef8e5cfd0b9e5a9946483.1795034153.git.enzo.adriano.code@gmail.com> <20261121112312.75ba7299@ryzen.lan>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_094252_329841_69EB5973 
X-CRM114-Status: GOOD (  13.69  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> So what's the purpose of this cpu-map really if it's all flat?
> I wonder what the term "cluster" should really mean, here? I mean there
> are surely different types of cores connected, with separate frequency
> and power domains. So the cpu-map should not be flat, but describe that.
> Yes, they all use the same MPIDR affinity level, and the manual talks
> of "cluster0" only, but I wonder if this is not what this node here is
> about.
> Looks like the RK3588 also uses the same affinity level for all cores,
> but has a differentiated cpu-map.

The map records the topology in the A733 User Manual v1.00,
section 5.1.2, figure 5-1. The six A55s and two A76s sit in one
DynamIQ unit and share L3. The BSP's separate PLLs, CPU frequency
policies and DCDC5/DCDC3 supplies (A7S schematic sheet 4) describe
two DVFS groups. Mainline can describe those with the clocks,
separate opp-shared tables and CPU supplies.

RK3588 and GS101 both use 4+2+2 maps. MediaTek changed MT8195,
MT8192 and MT8186 to one cluster each. The MT8195 patch says the
big and little CPUs are "in one cluster: fix the CPU map to reflect
that." The other two patches make the same point for their SoCs.

https://lore.kernel.org/r/20230126103526.417039-2-angelogioacchino.delregno@collabora.com
https://lore.kernel.org/r/20230126103526.417039-3-angelogioacchino.delregno@collabora.com
https://lore.kernel.org/r/20230126103526.417039-4-angelogioacchino.delregno@collabora.com

I kept one cluster in v5. Do you still prefer a 6+2 split?

Enzo

