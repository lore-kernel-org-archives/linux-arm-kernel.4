Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E3606A330
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yBAbLfGi;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=NZgHBH2l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IJ8laK9ppBsQ5w0QCVG99S6Wck2m41XXe6YgxVTshXQ=; b=yBAbLfGiUjJpnGPhjCqic0Gv1i
	toSQR4qp3cYIZn9d9a8hpKn9EmutTiF2hLFMC1SNGp87N7g5MZ39BTLOo3IUftNjbBB336NrtM+Lb
	hHEuVW4YgLlfcvptOPj+IRE6qeyrEnjaWN+HkOqySjUmv9d0kPXesRoKjrt7dMrPyRsGGcu641urv
	8SqRFvLP6MaV0HPo3PdvrBDvMpf0knEdsDdo+sC0bQhxOxRldM3ZMdRiFmB0JRUN9qaXlRxodGOoJ
	dgL2FmQRW/oSOJroCHAZJzR5vJyvuc4sjDzl4gj4YSUh8sdsWBc25Iaz2aZSCl4n7TxVP+ktxravs
	DX6bR0dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzn7-00000003I0b-2zf4;
	Mon, 16 Nov 2026 16:42:49 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzn5-00000003I06-0aAk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:42:48 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so201895e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794847365; x=1795452165; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IJ8laK9ppBsQ5w0QCVG99S6Wck2m41XXe6YgxVTshXQ=;
        b=NZgHBH2l7S+qqAo/ojuWdNSQt4ue6kF962mU5j5f1ok0lj8szd/NNyVa6heFkjACV0
         i2F90Jyg1IVNoCGGMvdBiS0HmTjiV/fxRDcZV1heJs0ywukVkaJ2ohru7csXIzI9fB6w
         aSCUq4gwdnXe3rwqdlRoJhoOmGGm5dFcoZOhT1erRLOGuTG0reWU4lvboR4SSc52Y0LW
         XxljEOwmeyXktTKvHdfb6xR84BPJWn7sfRqMrYfBESVBQTki34iiTmVmVovB54EEbc7o
         2EuQJnkN/5OV3psxow81DJPtnf1pCkNW7UPm+9nZLQJJDbKoWsSsmR1SbKe7gVQqG4JR
         Nijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794847365; x=1795452165;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IJ8laK9ppBsQ5w0QCVG99S6Wck2m41XXe6YgxVTshXQ=;
        b=ZcScsXoKB5q/nhcxXOVXDiINpY1YwHwO9PxB0rnpyU07opDycfFTctAYvimLAd+i/4
         dl9W9UW/W498yS4m2JGp5d6N6ZeAPUAGbYWdOIpebnshO/btmskBAEVRK6jBAXSTbgsp
         gNYzahFYWkDtvbyVb3v9zOvnG35wKSBhOf6HQmbwj5dphI/iuFo/A4ultXblrq0/xZEb
         gjEP01n/GjSGEQmbg/pUjweIquIp3rVsabAaZ075FybKBrQssKY6dWbjYJk0Gx4sPcxx
         6y3Qh3IysffGqaXY0yZTNUuQ5kcOuK3rJWtrfx933BspO3NJAmcyZTYnUL0s887GZ2gW
         prSg==
X-Forwarded-Encrypted: i=1; AL+hErGkkpv3W5iAY4sO674bki3InjB/xUGMHXnp5eXHcHJdvO35qxxVP3ip6TU5PsD0yKtRBo4Lrh3Nsrhvoi4oPGcM@lists.infradead.org
X-Gm-Message-State: APuU4Z9H1noP1MAja5dMHd7S3bP/H/J0VBxqIYzEiK49Vtvk7G7xKt3K
	vtF0wL0Bwkmc3MBjpyBejRqoYaQENvKxJKOnE1YNr1eMQ1tst7P4thixq72ockE2YQ==
X-Gm-Gg: AYBFou0Dbuf3l1NrEstMeGpU7b+kLg31woKjo3sOQGBrvGA66jL7QRm16LJRIjyaooX
	/KSAKDlsdZIdbka/sgRDeRuPURwObo2wnIAiC0+XOYfoUuUO8ZlmAkNcOxHsOwxYI4C81Hxy98p
	IRxiLVduZ8g/ixzjzAxi0qfDysZwujHddUL7OiQnk5ejqnpKucGLeCwJ5dUBSeR8AXEWH2OwYGy
	GZMFPfVCiLGktL4Rf3hVpPg2dImLP1V5myuo2tJO+MKShTFCKYPb1KW4J+8Kypzeu69xmkvmEhp
	u15GmCLbP6X3vO4q05ltVfLhX85EJlkBYu9A5VtLQ4OXmcCOJTb801HLWs7N/WC0xlF7Irs7k7X
	JOFpt8OqRuctmPd3c5nda21fKeCYRHYwCKtGH0Hc+Pguj+SuRx3s6xli++vDAQUMl4vqzSwdxFm
	EnUd3jNHIytuoVgE6fJJRmuBPkliX6NSZ3C6PueXFhOZPdDVlQUiOSY2cG1lfuFsMImWcXGoV2m
	DXPKMDjt+XhKytFZxbPw4KRe3/9cVa46u1whaCaNFC67xAVlnKonF4SCUErvvM2A6x6RHTVQ+Uv
	GQBXw6aEdCT11+NfB19ejAQyi2hRFOggkj2Mtip4cqPBbGSeU3c1UngqNaD/IIyy1d3fEEquDEo
	7tcqCIAHGQkQ=
X-Received: by 2002:a05:600c:5012:b0:4b4:a551:681a with SMTP id 5b1f17b1804b1-4bb7837264cmr1312695e9.3.1794847364743;
        Mon, 16 Nov 2026 08:42:44 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb783965d4sm791855e9.7.2026.11.16.08.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 08:42:43 -0800 (PST)
Date: Mon, 16 Nov 2026 16:42:40 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
	Mostafa Saleh <smostafa@google.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] drivers/virt: pkvm: Zero and clean memory before sharing
 it with the host
Message-ID: <avsygB0HdGxR6psB@google.com>
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com>
 <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
 <avsNdPissIDAb1hA@google.com>
 <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261116_084247_192926_ACF93162 
X-CRM114-Status: GOOD (  23.84  )
X-Spam-Score: -17.6 (-----------------)
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
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 04:32:40PM +0000, Fuad Tabba wrote:
> On Mon, 16 Nov 2026 at 14:04, Vincent Donnefort <vdonnefort@google.com> wrote:
> [...]
> > Ha yes of course, that's the host s2 we are mapping into. And on the guest side,
> > we are only changing the software bits, so no CMO. Actually I should have read
> > the comment in stage2_map_walker_try_leaf() more carefully.
> >
> > That said, I wonder if that shouldn't be handled by the hypervisor, just like
> > hyp_poison_page() do the cache clean.
> >
> > That would be slightly slower than letting the guest (who has a mapping already)
> > do it, but pKVM is enforcing isolation between host and guest, and it feels like
> > it should do it by default no matter the memory transition.
> 
> After the discussion on the related thread [1], if we have the zeroing
> here, we need the clean here as well. So I think that this patch is
> the right fix now.
> 
> Cheers,
> /fuad
> 
> 
> [1] https://lore.kernel.org/all/CA+EHjTywWTaKLtM6OPF_0ETv29-m8JsHdvF3BeW9Xa=h713eEg@mail.gmail.com/
> 
> 
> >
> > --
> > Vincent

While I don't disagree with having the memset in CMOs in the guest, I still
believe the hypervisor should do it as well.

Linux is not the only virtualised guest and they all should be able to trust the
hypervisor to do the right thing for them, which it doesn't.

-- 
Vincent

