Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F38606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 15:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IpgeGn66;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=iIFDFLo+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=; b=IpgeGn66JsUXceq4BW3/SuP8vJ
	/5TRHEltMoP/4YwnCnCw0yZ+IEm6+YHzW94qExVT+drAdsePDpYwQOUip5GARvs+AgvhIUJFlYYzu
	aXwTov89dL9B8xMXvX75tcyOv998K6H/GbTGuEogde9b/K+hOtxykVOn1DWe+U4VBzwmMk7DHnmqy
	SidlkOm0qDc0BfAnksMkH9NOWayLXn/kGASZuiM1Ox7UdkiA5A+ItRYxIq8g5BUjNspqFEubNCPSM
	tpn+W9aOJbVNslt1xSWLNFYCVU15RSXMRiICY3iPzA/Yky0DGyYEug7WXgO8yx98GX01iNQGW4NSf
	UNxAy72w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKj5-00000006Fp0-2KW2;
	Tue, 17 Nov 2026 15:04:03 +0000
Received: from mail-lf1-x12f.google.com ([2a00:1450:4864:20::12f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTKj1-00000006FlE-0G1M
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 15:04:02 +0000
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so6767e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 07:03:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794927835; cv=none;
        d=google.com; s=arc-20260327;
        b=oJ7uS72AkntteuK4UI3Ww0KJStKX2Z1WlV4uTElfp7r9e2ZL6EaXHB8S5/KK1RrBup
         /TM+ClHuWlYXD8INbw8ErK/GiMOMctcTt050DpcAlP73lz9k3bvgHQJttVd/h+EsiThE
         X3J2F2KDjrVq/gJIk2L0ADdl1pfrJhwBmc2IrILr6mOIfQJhJH5Br/HQ8p5JTQt/SCmg
         NCofAgOXQRee1UpAfBEK2pXWa9KFXIVnoyprG4BSGIaMsynM+fiFTIL+ZtxVgzXNHFU5
         wCyfuEulsPFVwfMUNZOlniY/0iNaQfb0LIRaWWiB4jII8I48pnFlU7sUOHQGg6YqpWdl
         K14g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
        fh=pSpGlEruAVkeuigbQi3m1ZL3M22A6wTHaPA1owlEnJc=;
        b=irIawejY3qkEJbDyXz95u3k1eArT/ol9eRROw7ZHv8zbRy74bxdXPJMZf/vwKBo2UV
         32UWqYdfQhdNa+f/s4F2GRdxn96qLZuShNM3EgVI3Cwcd/cAtjhOungHXPwTBZlT5beW
         474b5zxuHfPOo2djGGibg1V4Bo2rLG2Z6hhdFVcpvyjrptPLKAW1amouobL/CdPW99Un
         8bnWfu8j7Z6MgedpjTFNCNtnWn6ZeBNwPAOcctx/tu/nkqD4hKwFxLWqMfYXZhcq/NZk
         v60pk8PFA0ZmH8uzTI8TznrNH2fECWPFpJRxjVPENk3WuIHZ/q8F8mR6c/0ebe0hGRj5
         KoPg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794927835; x=1795532635; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
        b=iIFDFLo+0VXtV3XaNlA/sHtCcnVx9NeY+KckMuk6pLo51v1C5DXyuCOpdAj12+aJZl
         EvhCp0NWNYWZZMV8ReVtvkmAAwfUD/ptMdkpYQa7gf0jfaWHaycObNn6hPcttEQw4F0d
         MaI1o78juMGYp8y3D5y0KkeDr1x7IRG4FvZEZ1sEvwIKZ3M9iISjfVYs2GAkT7MW3pV6
         OUFuxoq0T4oOi0cZAUO6OAZc/spUjzxpGM+tKQN2X+odWl6GBQdjx1KZHLsGyGpDET1O
         Wfm/mmUiLM+6BDtqqUTWqbfLGaFCuoEROMU9mKHjOeI1G4PfODVKPTyy7QpnzfhN+kpz
         QEGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794927835; x=1795532635;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UR0Gfgv/fdEsWHImhEXrlTh92/mXRBGXB0/jlnan5Vo=;
        b=PS5xu5svktD/TMwIn+A2g9731EIglWyj8BqJomDOzSZXDTtFusrhJ7aIVxpj3NUu/K
         jnRUIA7DR24vsmn8jKmoT+Yr+ciNUkC7J6+t9fe89+GXdFX1lHpDzf539uy3o/z2dE6s
         RyZqHnz0OXwtPfTesaZVczHfbc4KI8ZLQfTaWjL0haTzAd9AsAhbbFd/vIWGvJptnFlj
         +aEEPtf6kMVdFpRyFKlERyCAkmlqvyMtIFSBDopT6BL6kNlN9jfl6BYw+AXqbVgybt9O
         ITepaMaWiKfoxGZvVNOJwJONtJdshU0OC9f0KGEBwQGModC/9eeBrqTdcL5pjVpcXUT8
         Cm3Q==
X-Forwarded-Encrypted: i=1; AL+hErGOjaabp61BJU40Sff6IOJxxsqpwRqX1VLzMBG9dnwANkrHZmGMaBonTAv5AfL6NSiBT1LnOd69G41kbK3cIg5s@lists.infradead.org
X-Gm-Message-State: APuU4Z8hMKZJFMl5Mw8TVOPxwFE36kPiiUrAEnPV/5vWnWqEUOJVtWvd
	IerRm+BsFJLloNbO4tD1zpSXeg7FeV14UpmPkVhnDZAsL53PEp9UIOjcczi6HR74mffBjCD+tW9
	Zj4SeSbU+SsL1vldpbOl6zQlafy43STP1xyJggyZC
X-Gm-Gg: AYBFou0yRMa+7q1XRLWJ5RU4krYLvsnDO4GP8pJ78Mq3VSNvK8tdcXlNSrkfRV4BNXN
	ArXZmOQhDKBSDnIwYsY9kzMkJaS6h5LiQA+b7k56DVFStoTkYSSSgIDPuSQlyYGIQv6/Crhfpy7
	OEAxUIZJzVESAE5JW5FTkDJyIXBuKxHHoBkFgzvuTKOFL6LsArByKiCWKmACG+65affEDlbd2dA
	3o6puPC4Ynlz8Z3n2NlREH4SlGJ6dy2MEsnCn16lU9CkkB2NppjR7ezwze6uNf0ZtLauCqQqKEt
	cEjF7K1Awk1O2A2nyq3PDosSTf3ospghxI2uZ8opoTc+GftdcwvhMzF1Oly0ZqfaE85O8md6x0b
	4k8owYJCVsqLI0qhogs4LfXY82OiuO69R8ZZccaRQEktT8d8VKjAX/ry86HeHW1NjsGOMX1IJGm
	ronQNwUDMtKFtanNZ/7bNUBNIf
X-Received: by 2002:a05:6512:2249:b0:5c1:543d:2e3e with SMTP id
 2adb3069b0e04-5c1a2166b35mr171174e87.7.1794927834031; Tue, 17 Nov 2026
 07:03:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116164358.142785-1-steven.price@arm.com> <20261116164358.142785-11-steven.price@arm.com>
In-Reply-To: <20261116164358.142785-11-steven.price@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 17 Nov 2026 15:02:00 +0000
X-Gm-Features: AclHuK_cslY3zjG6J6IGbNXJdnealsL3yNGOi2bev9GDyOWEmQLYI5dVsAlimaY
Message-ID: <CA+EHjTy-0k08Ukyo+4mmzqVn9UjRnvhy=BQT9kxSj7CBzzwO_Q@mail.gmail.com>
Subject: Re: [PATCH v3 10/11] KVM: arm64: Dispatch stage-2 destruction by VM flavor
To: Steven Price <steven.price@arm.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>, 
	James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Christoffer Dall <christoffer.dall@arm.com>, linux-coco@lists.linux.dev, 
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gavin Shan <gshan@redhat.com>, 
	Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun <alpergun@google.com>, 
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>, 
	Vishal Annapurve <vannapurve@google.com>, WeiLin.Chang@arm.com, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Kohei Enju <enju.kohei@fujitsu.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_070401_345832_211AA248 
X-CRM114-Status: GOOD (  11.75  )
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
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Steven,

On Mon, 16 Nov 2026 16:43:56 +0000, Steven Price <steven.price@arm.com> wrote:
[...]
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
[...]
>  static void kvm_stage2_destroy(struct kvm_pgtable *pgt)
>  {
>          struct kvm *kvm = kvm_s2_mmu_to_kvm(pgt->mmu);
> -        unsigned int ia_bits = VTCR_EL2_IPA(pgt->mmu->vtcr);
> -
> -        /*
> -         * Realm RTTs are inaccessible to the host and may contain stale data
> -         * after the RMM has released them. The non-root RTTs are explicitly
> -         * destroyed through RMI before the RD is destroyed; only the root PGD
> -         * pages remain to be freed here.
> -         */
> -        if (!kvm_vm_is_realm(kvm))
> -                stage2_destroy_range(pgt, 0, BIT(ia_bits));

Could this patch go before patch 4? Then patch 4 wouldn't need to add
this check.

Cheers,
/fuad

