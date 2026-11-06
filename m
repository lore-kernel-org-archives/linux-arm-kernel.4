Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E482606A329
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HgrQUwoT;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=gWMGJ00x
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=t0uNok79xtcOaBj7hUV1cORn4nx2YFub6xhgV/RBq9I=; b=HgrQUwoTXHao39AaFF+rjX+FQx
	P5D5Ctti1zQB0lHJgtNEvRHOIU3dmjneyyTfKGAndb25jLYIZnh4O2fxkYq7GMLvywHWDlY2sOLCq
	6Bke/BaJBT1yM7xooHkU6KkoXeJ5QQuHkXKcrpJYDLsLCyVV31mridMw3Dt28d0oG5ZyUiOXxAKG7
	2G1Kiz6VCKmX1hd7sweXyePaxB/z08O8UD5vyVtjgr+XDXYSKA9PBhCew0qYC/rRdB1uBL7wkC0LR
	ZtBpLlYSB8dsND0ahdG4d9gT+L7NqVbUXprf55HQthoUBMO/a6ouyNjOAjYh7/f1YxPDATv4qGY2q
	wOh9hidA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMKa-0000000CvGR-0dTl;
	Fri, 06 Nov 2026 15:58:20 +0000
Received: from out-193.mta0.migadu.com ([2001:41d0:1004:224b::c1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPMKX-0000000CvFD-1L5L
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 15:58:19 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=t0uNok79xtcOaBj7hUV1cORn4nx2YFub6xhgV/RBq9I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793980693; v=1; x=1794585493;
 b=gWMGJ00xOrA8SD6jvGCgs9IL4eTlb8JgU8LPbLLOas31NmgLp3l027Snu1NzAx9tdUum6/6h
 XvXv33Dk8mzhkyPEoJXCu+2HsXlBOgNHO7j45UVK2Or9A+5CFxh2y26hNZSaKyq1F0xZ2fWMOzr
 +O4Tta4aWpOQE0AKfQzx4qaQ=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 1723f9e1eb6e3bbc;
	Fri, 06 Nov 2026 15:58:13 +0000
X-Mizu-Trace-ID: 1723f9e1eb6e3bbc
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be3b2f17c1so875e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 07:58:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwZf+KTRJtjC9/gVuPOXEpqG8LoP0xNNJjXX5P+OXLhyekntWtunAkwKo5XKPm0//jFHyXK8d3E9i8z8aDPayj9@lists.infradead.org
X-Gm-Message-State: APuU4Z98sgfhuO4HA+bYjb8WrqrnziYkWYuiStHlXmknwPme1RytN5vg
	7VaXIZlag79PkQEJy5mXF2aocaj6cRuC9obkqUcGj5cZdBQXhNIIn2stkzLEeccmNCXVgC5KxFD
	EvLVZPyJqe1BCZOK7+2FETxheFpu/i4hEMtFgKA0g
X-Received: by 2002:a05:6512:10c8:b0:5bf:ff8d:111c with SMTP id
 2adb3069b0e04-5c00a301a4cmr13851e87.7.1793980688227; Fri, 06 Nov 2026
 07:58:08 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261106120221.347309-1-fuad.tabba@linux.dev> <20261106120221.347309-2-fuad.tabba@linux.dev>
 <1312ec44-bc4a-427c-876e-1405e8c46e0f@arm.com>
In-Reply-To: <1312ec44-bc4a-427c-876e-1405e8c46e0f@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Fri, 6 Nov 2026 15:57:32 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwGOWqhdQxC0p2LBupLjKdkNbZEzGzWjS+ZR-XSbTBt+A@mail.gmail.com>
X-Gm-Features: AclHuK8NtgOFZkr3lcGennwjJa6alIz28AdxX8kBirDq8O8OUlKzbOWacoeokzQ
Message-ID: <CA+EHjTwGOWqhdQxC0p2LBupLjKdkNbZEzGzWjS+ZR-XSbTBt+A@mail.gmail.com>
Subject: Re: [PATCH 1/3] irqchip/gic-v3-its: Zero ITS pages before sharing
 them with the host
To: Suzuki K Poulose <suzuki.poulose@arm.com>
Cc: maz@kernel.org, tglx@kernel.org, radu@rendec.net, lpieralisi@kernel.org, 
	steven.price@arm.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, will@kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_075817_492919_BC3AED56 
X-CRM114-Status: GOOD (  11.23  )
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

Hi Suzuki,

On Fri, 06 Nov 2026 14:31:56 +0000, Suzuki K Poulose
<suzuki.poulose@arm.com> wrote:
[...]
> We hit a similar problem with CCA, but not from a security perspective,
> but a functionality perspective (crashing the Realm VM). There was a
> patch proposed here [0]. The general consensus was to fix this for
> all "shared allocations" and Aneesh has (had different attempts at this,
> but the latest) series is here [1]. Do you think something like this
> would be preferred than fixing every caller like this ?
>
> [0] https://lore.kernel.org/all/20260820150034.88729-2-steven.price@arm.com
> [1]
> https://lore.kernel.org/all/20261104164555.3555725-1-aneesh.kumar@kernel.org

For mainline, yes. Patch 2 of [1] zeroes the memory inside
set_memory_decrypted(), before the share on pKVM and after the
conversion on CCA, so every caller gets the order its platform
requires.

That said, [1] isn't stable material, so I'd still like this patch to
go in as the stable fix. Patch 4 of [1] would then replace it.

Cheers,
/fuad

