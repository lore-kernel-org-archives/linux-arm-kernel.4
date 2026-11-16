Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC62606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NRBesblQ;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Q4LEPZ1o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GXr7TvVYy4WPx6ph5OJOFoOmqPDe/zCDq2W6XppAZFY=; b=NRBesblQZ8AI2E9G5gRgDGHBhi
	KC2BOuJCMGPcy1oy1H6QuyVkEk9fOxcrXfRfPt1SboTaQeuHAqm1BqAJR6Qfqig0tQ3Kz9/XxCdu1
	uqXHW/qbb9j6PaFSwTAto1C3Sbkn35aBHjaJvbXuvf2/Z849WScuABCgdFiNXU8b0eJR7UGVbIkdY
	k524j9zTPWrA87yZ92RwTZARlbRWf/32nCq/xqDtcuPLjxeWSm7ojPUx4JUBbUvcs7vZ3W0ncsEcF
	zt1UU48RLUhfyQW656d2Kd83pI1Aw7Mgto740SJuankGN7dV/E9jgCR2Ro1DU+ju8m8PDe30ZQFhn
	0iHRkX2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSze3-00000003Ehj-2bV2;
	Mon, 16 Nov 2026 16:33:27 +0000
Received: from out-88.mta1.migadu.com ([95.215.58.88] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSze0-00000003Egf-2nnP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:33:26 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=GXr7TvVYy4WPx6ph5OJOFoOmqPDe/zCDq2W6XppAZFY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794846802; v=1; x=1795451602;
 b=Q4LEPZ1oAorEOJ+Ui1uVWzCQQ7BnltUgPQI6SgJh6jAzAO1jPTpoHxSgepqxTaMQznzt+o9h
 1CkBZ21/DwEpqjwlOo9hJMLdRmv/6KyTd3SQ/Q+twDEgnCt6u6QKgNDr8T8hf7MAOzmFWuooXWN
 WUnE10/XCxskQsZwIgkCjHrE=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id f080717360f59be8;
	Mon, 16 Nov 2026 16:33:22 +0000
X-Mizu-Trace-ID: f080717360f59be8
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso9827e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:33:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFub+O/ZOVjnh/e4+zfKRS2VVPLIjD/OnmOfxB7s4G2dJx3vztjaCG4ChYZJ4gqZp7/G+TAYrAOAXUssRCL97EB@lists.infradead.org
X-Gm-Message-State: APuU4Z9ealIiw0Fk0Qiscg/J087R5RAMbEm4ky8kGEva1fzfR5hWjZOU
	1A0nfteLXgkB1+yEUkDPVxgvwry3mA7PYTRse+SiYQRR4eF31lhZN+0fDd4o12GpkFMpGpFDhpJ
	FwRvL9RDdtf2aJxiSoYHzUALI2djp5Fq8X5uRUfeG
X-Received: by 2002:a05:6512:1156:b0:5c1:5978:6abf with SMTP id
 2adb3069b0e04-5c17e42fd2fmr254711e87.9.1794846796829; Mon, 16 Nov 2026
 08:33:16 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com> <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
 <avsNdPissIDAb1hA@google.com>
In-Reply-To: <avsNdPissIDAb1hA@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:32:40 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
X-Gm-Features: AclHuK_oLN7lZHnxxyf05gt8nVYYVHzgK9T59Mb4I86hjWlMfwLiJmejDHvb7kk
Message-ID: <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
To: Vincent Donnefort <vdonnefort@google.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Marc Zyngier <maz@kernel.org>, Mostafa Saleh <smostafa@google.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_083324_872388_06F8A827 
X-CRM114-Status: GOOD (  16.23  )
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 16 Nov 2026 at 14:04, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> Ha yes of course, that's the host s2 we are mapping into. And on the guest side,
> we are only changing the software bits, so no CMO. Actually I should have read
> the comment in stage2_map_walker_try_leaf() more carefully.
>
> That said, I wonder if that shouldn't be handled by the hypervisor, just like
> hyp_poison_page() do the cache clean.
>
> That would be slightly slower than letting the guest (who has a mapping already)
> do it, but pKVM is enforcing isolation between host and guest, and it feels like
> it should do it by default no matter the memory transition.

After the discussion on the related thread [1], if we have the zeroing
here, we need the clean here as well. So I think that this patch is
the right fix now.

Cheers,
/fuad


[1] https://lore.kernel.org/all/CA+EHjTywWTaKLtM6OPF_0ETv29-m8JsHdvF3BeW9Xa=h713eEg@mail.gmail.com/


>
> --
> Vincent

