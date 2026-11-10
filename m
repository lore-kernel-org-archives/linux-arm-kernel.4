Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E26C606A337
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 16:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EBbq8YF1;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=s7yrZJ93
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2ZJ90WMhfR0YfvdBTSjmWuZ2Dnb3Sle3TRFQ/lQ57LQ=; b=EBbq8YF1Zc8pbvA5nQFkwdflAX
	AB4jJNUwLL9moG0/DSHIxq7IeqFmD+WxaK13sqarw9arG6PfATYp2mOZpl6+U+KCo/J9+12cS3UlA
	4LLQDLXRjbMKy+kVfyKvW6xOvJ4k2DSgD6Sj25tpdxXW/MeF8VTAQBYF4IsZFToc8gpD7YAIc7TTc
	HYCx5zann6cMiW0Mda6w4BWJtbjlLIna3y5TX3BCp9JVuh+Ve7fp0z2bFhyB6Ht4i4XJXWczIYvvm
	YuUOme3L1Prudn33JmXVDlU+2z+AHNu+x01itcH2fzQURClR731xzszar3MTFj5BQiLI5SsP26v7m
	VYs8yB3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoL5-00000004TYI-3Gzb;
	Tue, 10 Nov 2026 16:04:51 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQoL3-00000004TXj-3pT1
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 16:04:51 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c4d28f75d62so298236466b.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Nov 2026 08:04:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794326688; x=1794931488; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2ZJ90WMhfR0YfvdBTSjmWuZ2Dnb3Sle3TRFQ/lQ57LQ=;
        b=s7yrZJ93mCS3RWU/S9UPooaRZihhcokixXea78K0gnD3FLKlMuJyAGL0tgR0Bbo/41
         S20lBDBq0yjQTNmCLLgAMyhIr5UbgJ7QIgL7Hb2Bvnq0bispLa4YyY8whM+57r2o87aZ
         9/oDNTlzQmAcBh5Ik4LCsq+K6XPdmZUsVrl/NsMG4FiSX2W819t36XCZXyxUapOGLl3p
         otsuDwwMdZzA9vyd3D+XuijxJ+um8ZcxixgvaYT+24PnS62PthJNebEDeACEVN34AbyO
         Y7ffBF3i9DO5R70LLOaR8nJx0+DstBb3IAX0O8mkpmM5ddPQvSvPYOQV3s1nOwUOYAvr
         thng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794326688; x=1794931488;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZJ90WMhfR0YfvdBTSjmWuZ2Dnb3Sle3TRFQ/lQ57LQ=;
        b=vM/r7ZcOEBIPY5hUvvfFSISbmO0PLQcH4a1tbYuvVc8Py6PWdDo81xkd7PbsUPNANn
         jPhYM496eIjp6cXA2bzxf+lVmbHDwCDk6cDUURgZrloXG1GAOuTWJFgtN2gWog59IsMY
         seneTJqKpiCBsWVf8UXUGjIhNN5vpXwdDxNrCOunxjMP75wPsFaJ9HvBFNOx4cDPTxYj
         94wigSiZvasuhlFYtn/L+hev5pqYIxecqwoT0qm/eLwpTzI9j7PJotr0Bk2RqBewAHvT
         MbdRVcStgrLHPckG1fcB0yszuhkX5vbit6IwhY0yqlgX0Sgi3QQ4YOdEKg3F2v2ewkMN
         Fhkw==
X-Forwarded-Encrypted: i=1; AL+hErGGj0KevG0kd0gQnNUBJOv5/SMZoKGlGfuHxXvYCU21R7yQHjCD+ok3jg7IpU3sLEnFouHn0xo4IyADZEBvjKQ9@lists.infradead.org
X-Gm-Message-State: APuU4Z93JwTyTXU2et8Zo843fKh2nMOu19zDjKo6eoE+i8KsDPxQa0rF
	lEg0Q3fx1grCmq2wyQ4n/Sf12CFdwNjEkzT5ij91jzfUCzXOgIcAjmv9
X-Gm-Gg: AYBFou2H540A76O+dw0dcVcNsedVmEcOjVE67WuP3ZeFm7QiX+AAvl7yAXiecq7jdSw
	MY4Pux9omR7NFtFEHCLmDA6nOhTkf/y5vONv5ZcG7CY3HNqwe7NXPCq6LpMQW1CQnwzyRhykKWq
	4W0P+LzOHNUcvJDgzh5QYWdzgf0eF6qDWLuu+PJVS+PqxXtxUFkOPbFm5nd4VRWzcU/zWhKFCW+
	5Zz5fEuYDSfFUop98WAFWaamLnH1Ar1uBDP47CRa3PxvpxgkKek+Um7JVpsRUA0wP7Sqa8EGbEn
	GXSkv3VTpWpMYrwLJSgolzC4oOjvwcxAG9EADEGLfx8JgJ6R0thlBSKyZ1yz1KZX3bdsv9e2A+W
	j1M3duuXwI8l/CUD4JMG2ym/qyEzXg0AzMgrdgK+hqlZJYA5a9kyeNevucA+kKBAeJ0LsVw7tIp
	8n8oMpto+hDGO4QIoewCLIaoaaaAuM8lcidl/MXjZD0kATlNfkvH8lwzUH+8OLCV0NN0j3yQQ9A
	Oi/bCiMNRZOK7TjLaug1OjJAUAOaVawCrsqvX50LxSSe7CM9j01DziMevT2F+UuzH+OQFHckUw3
	XRfVQ+3w+/L4nVT8HA9LwK6ViRxOlLH2w4P1rxCZDvhmgjURADc3O36Y2FWYOuuu+JgFUGcWEFv
	lSxpzV7/7Jedy0olCw6BwWB1dh0QPGK4Gu+n42rlMJ4rhuIjA5d/skNEGJRqAHhSrgn3B/cMQQ8
	Po2aKpudv04hvjALUA8zRFvc+n65qBOd83fIQaeJYpJDVguXwQXuIJSsrT5p6s5aNS38OUWmrhb
	jSZ7LJtZEJYwNcpALcyQKivaeJdaeBkC8FM/emdEMR+uV5nr/s8YTSjHWrRF3k=
X-Received: by 2002:a17:907:6d01:b0:c49:8f1e:af0a with SMTP id a640c23a62f3a-c50491bd4d4mr262123366b.7.1794326687814;
        Tue, 10 Nov 2026 08:04:47 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-12-36.dynamic.telemach.net. [86.58.12.36])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a643f12sm127127266b.62.2026.11.10.08.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 08:04:47 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 aiyengar1990@gmail.com
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] iommu/sun50i: Don't report TLB prefetch walks as page faults
Date: Tue, 10 Nov 2026 17:04:46 +0100
Message-ID: <XuGVSzNrS7KQLWfGI0rB-w@gmail.com>
In-Reply-To: <20261110-sun50i-iommu-prefetch-v1-0-43428e792ef6@gmail.com>
References: <20261110-sun50i-iommu-prefetch-v1-0-43428e792ef6@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_080449_974667_7C042A62 
X-CRM114-Status: GOOD (  22.80  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Dne torek, 10. november 2026 ob 07:05:16 Srednjeevropski standardni =C4=8Da=
s je Arun Iyengar via B4 Relay napisal(a):
> On an H616 with a display scanning out, the IOMMU reports page faults
> with master -1 at the IOVA right after the end of the framebuffer: once
> at the first fbcon frame, and then once per frame for a while after
> each TLB flush, e.g. while a video decoder frees its buffers. They are
> failed walks of the TLB prefetcher, which the hardware flags with bit 31
> of the page table interrupt registers and no master bit. Patch 1 stops
> reporting them. Patch 2 makes the remaining fault messages say which
> walk failed and what the interrupt register held.
>=20
> Tested on an Orange Pi Zero2 (H616) with HDMI forced on at 1024x768 and
> three 4K H.264 decodes through cedrus, on 7.3 kernels with and without
> the patches:
> - without: 214 "Page fault ... (master -1, dir rd)" lines;
> - with: none, no "Page fault" line at all, and no decode errors or
>   timeouts.
> Since the patched kernel prints every fault that is not a masterless
> prefetch walk, this also shows that the hardware sets bit 31 for these
> walks.

=46irst off, display engine isn't in merged yet. Second, I don't observe any
such issues with my wip H616 code.

I think it's best to wait until driver is merged and can be retested and
merged then, if needed.

Best regards,
Jernej

>=20
> These patches were developed with Claude (Anthropic) as a coding
> assistant. It investigated the problem and wrote the code and the commit
> messages; I reviewed them, and they were tested on an Orange Pi Zero2
> (H616) as described above.
>=20
> ---
> Arun Iyengar (2):
>       iommu/sun50i: Don't report TLB prefetches of unmapped pages as faul=
ts
>       iommu/sun50i: Print the page table level and status of a fault
>=20
>  drivers/iommu/sun50i-iommu.c | 50 ++++++++++++++++++++++++++++++++++----=
=2D-----
>  1 file changed, 39 insertions(+), 11 deletions(-)
> ---
> base-commit: 2cf4be57b301ed2d7af82e70cff5dfd96894d8de
> change-id: 20261110-sun50i-iommu-prefetch-85cc9ecff559
>=20
> Best regards,
> -- =20
> Arun Iyengar <aiyengar1990@gmail.com>
>=20
>=20
>=20





