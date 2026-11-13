Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53076606A337
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 17:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rRiF7t4u;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cvq14Rxc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zTGaV1UloT0Chf0ol30qq10ZNwEvfaESId1U8G45Gn0=; b=rRiF7t4u/bYcH5Itr0yxG5snln
	LDW3ObYD6CL7yHju9J4Mlo0R7NBDJ000U/u+7cUdqh+Lqg1LK9UzQnK2qfRWFc0exA8BoVH5FBA6m
	ZQ6jd9jrdq/faE0svmLGmdIMMO6g6P6RjBHPE13cR6dHF1hhEx6l9N0+7qlajpG9pbXq6VuVQ8mwY
	5M7Rr9P0eEXsGiEf1HFs5k7vncbDyQvi4HRwKjKOf8uekmchgGzbCdxlcm6Dvb7qczAkUKJaDW+py
	LNOtUwRgqDy6zjixQuyU8r4s8kq50MiXesvWmJB7/n868jwjEZAkcU4n51cog/V0/d4+asZW6aHyY
	yvCLotBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRulx-0000000Dh82-3OI7;
	Fri, 13 Nov 2026 17:09:09 +0000
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRulv-0000000Dh7c-1TWC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 17:09:08 +0000
Received: by mail-yx1-xb12c.google.com with SMTP id 956f58d0204a3-67d8221074dso1302732d50.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 09:09:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794589746; cv=none;
        d=google.com; s=arc-20260327;
        b=ha+0/5iHv54dfLXpTfGrMWZA3ieqpkCLu4+/uHuwfDaky6nIwei2Ei2YV5Skz+4a5S
         RHWWNGBI8zDUtoXEOJO0sGsAIaljYzdzlz3sRbnQIMsycKnWqZG0s3NmL8LkvArg4kz7
         NMKxnI+q4W1PCeQ1i4/z0qElqYEhcMkGx7Cw/jazNWcy34ESPxWPqoJpqed44+llJxQu
         P68QFrDmtAfmWDGJkegVyQrGSltzF3ZiN8Mm3+OwkZ8cecsqFGjBBcX8wOJ4OBoFhOlL
         w4doYy9XhTS2Kctc5Mt9SpfyBVBMkdzDIIBC0awnjyIWCIOYRLzBod7S1nrTV2dporgA
         qa7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=zTGaV1UloT0Chf0ol30qq10ZNwEvfaESId1U8G45Gn0=;
        fh=7ioYfRgAa60zyEL+va/kb7l79qqVs01TGLI1mMzkkq4=;
        b=DcxoCfqsKBdcrtOE553Sacrc1fBDBVKaYp4NBT1zdtZWSAo2l/2eQuSQ7nD+RrkNIj
         7IVS2c9frL7zt3UwIJcbcABJb9uAZCK1yIJvQ8rUPDYKmDhEZDrTmYDewZXOwB/Q8keS
         IWNiSY9EpO4UQT6L7c1RXDW+lB8R+F8+2NW1eWliVeEpxQbHZdDOYVk0Mvy29qKjHTa7
         PfwtRxj3ThljwtummzzJVh8Laa02wOZ3NbHsuIJ+Gmcb6fTRQPuco77+tfO6anf2rn2z
         HB1keMegfLFV/VitjDqK8tnItSuYXx4EI1IBdDBy3wGR4RrSFt1LV25o2PyTJrbRxqpJ
         MW0g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794589746; x=1795194546; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zTGaV1UloT0Chf0ol30qq10ZNwEvfaESId1U8G45Gn0=;
        b=cvq14RxcwBNzn/XxWROlAM2hBiW5X5tEk85l6uwVD13JlRO4j/EZo683DB5t8d61ug
         yARxpkzvsEKI+WykMHbfQXVjUZi5v3eDbdr+UIo9jGdh2X5/0MCKEVy3fqLkpTZtiful
         E32iGn/PP/SlY1bPuNsm/LbKyG9BwbaQ1BjOtK7cS0xWEWp3MN6g1IdqFG60Vx4+0yHN
         /1YOuzwbwL3lGjYhuxlMRFcIa2CyJHE0BrCIODcgCCZVNn45vAetxHquspxtnijsdpkP
         DCfovGN1of79N1ffr39cH2kOIbMr/4xUyN0pWblGmGUyiq7U2BLZUCpeY31R6vCySMrJ
         krYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794589746; x=1795194546;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zTGaV1UloT0Chf0ol30qq10ZNwEvfaESId1U8G45Gn0=;
        b=xhGqKfQ6Ng3jCgZtaWLm/GX4HueOXfDLVWq8G8m16/Cfm1Dsu6eOPVKM/oUwX6Oywr
         0wFtFKQINaOy6ga+mRj1WhuwLepRHyrVmWF3LYdjVz3dFDIzZfQrOidpp59CKd3KVmsr
         zU+uNqmj10VDkCCQ0mdw/tWWFp1+X2mobrlppAKKGySEtcuNLWuEs6jtTvDzoSIgeul0
         zB3S/Gz0mIEbWmIBSNhwM2L2gW6tM2UAIDgHI3a4rlajmtHCViUULB78Z6XEDSmo3UxT
         eQkdEOHwMam0BHrc1PXckqklMyUD14sRr8MQ/R1HeIsMx8CJhwieE7hskgD3R3JP5LUr
         xM2A==
X-Forwarded-Encrypted: i=1; AL+hErHW8pq4ldee6QVqqrMxPa6j7nPz29TwG3iU2Ijvrj2/giw+0pu+K5lCtQh63B1XcvL1fRG1HOhHH8TdGqVYHgnJ@lists.infradead.org
X-Gm-Message-State: APuU4Z+dwXE/vT6ZJ8jj0zOS6094yApI5HRGI79MP7vSGceaaAXPpVF+
	H1CrAE0aXoqwfAMNupETs3RjFoMzv6bA0xSczQNI+cOKDTIM4O6FEyjqO7G0jJN9ri6/OCM+wWZ
	XLQw4bB8vSPHQ9D8K3pB8Gkjq64cfekg=
X-Gm-Gg: AYBFou0994mQiSOPfW+xDob/+Aia7mfJbJbL3dThaeeEnnxIl9Uu4eHKdAZAqUVmSoK
	lOPYem0sZDoYGnYuGv5Fnyt6ADim9c3CadfYzU/4wzv524WLAkoC3ACpXbxe6d4+E37+SotS+Lp
	U91LWbXmMZAu6ZnWqfE78lJCtrW1wSgj4deswxizQFqNavDXHAlU1GwldBeGofKZFUh3gY9cWWt
	zhTDkoC9Q1B8NoZf0ucaT8f8pKtwY06ZLKxveRUigQarV4m5KcjI3GzDhqJmnKBqCBFbWq1FbVU
	0CSLxkmOECMEorr5uasXE7+xXsdnbEvR4SoEIn1FFZwu8dPPYVdCtem+TcrzypFYpSvx31L/Stk
	N5Gdzyaz+Z67XbD8nfbfnKu4Hav7St1xT/0k6QxlmRLbnfZmo59IPHf2R7K4DGCMsbetcDDxfeJ
	4K0GfU5E3CzmvtgumPmEoLHyNbs0kW+1zX2/TUbaRZMTVFkBDRHfM3FqfCAxCjC5hNuXOvlVhPf
	SGrvpfv
X-Received: by 2002:a05:690e:b83:b0:67c:1fc:2a49 with SMTP id
 956f58d0204a3-67d970207c9mr377453d50.54.1794589746003; Fri, 13 Nov 2026
 09:09:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261023070110.1833446-1-fuad.tabba@linux.dev>
 <20261023070110.1833446-2-fuad.tabba@linux.dev> <86fqxwzul7.wl-maz@kernel.org>
 <CA+EHjTw08SZC_3Uodt6ew6vXVH-doW-8G41fVCF-rmaKsv+0fQ@mail.gmail.com>
 <86ecdgzp6m.wl-maz@kernel.org> <CA+EHjTy0jpY3sdVCENJRj_kfRDwbZ6TpkCAHQ2xUO-7ZuErpcA@mail.gmail.com>
 <ad724195-3452-495a-a50a-5e5c8093a483@app.fastmail.com> <CA+EHjTyLnAXanf9R7SuoL3gFZUNewX7QOnW=mc3qzwvaxg7jJg@mail.gmail.com>
 <040cf379-baba-4e3a-bf3d-6bc009a9e28d@app.fastmail.com> <20261112180741.17614-1-sidchintamaneni@gmail.com>
 <0a5e252e-1494-4b0f-a761-d984238c9d0d@app.fastmail.com>
In-Reply-To: <0a5e252e-1494-4b0f-a761-d984238c9d0d@app.fastmail.com>
From: Siddharth Chintamaneni <sidchintamaneni@gmail.com>
Date: Fri, 13 Nov 2026 09:08:54 -0800
X-Gm-Features: AclHuK_eSsuSs47N6QK3g2E7GgnMGVY8PMc7m7IxLZzX0JjkDZoYycjEKtYvyFw
Message-ID: <CAE5sdEjVx-eGz4hkN3bMMJAag_g0hm+J18G6JvFH814Z4_ZGaA@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: arm64: Hide FEAT_LS64_ACCDATA from guests
To: Arnd Bergmann <arnd@arndb.de>
Cc: Fuad Tabba <fuad.tabba@linux.dev>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oupton@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Zhou Wang <wangzhou1@hisilicon.com>, Navneet Singh <navneetsingh@microsoft.com>, 
	apais@microsoft.com, rlmenge@gmail.com, hargar@linux.microsoft.com, 
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_090907_409005_9DFDB249 
X-CRM114-Status: GOOD (  25.11  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 13 Nov 2026 at 03:31, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Nov 12, 2026, at 19:07, Siddharth Chintamaneni wrote:
> > On Tue, Oct 27, 2026 at 02:48:29PM +0100, Arnd Bergmann wrote:
> >> On Sat, Oct 24, 2026, at 09:14, Fuad Tabba wrote:
> >> > On a host that runs at EL1 (nVHE or hVHE), this also requires
> >> > __init_el2_fgt to set nACCDATA_EL1 in HFGRTR_EL2 and HFGWTR_EL2, and
> >> > __init_el2_hcrx to set HCRX_EL2.EnAS0. Without them, the ACCDATA_EL1
> >> > access traps to EL2 and the hypervisor panics, and so does ST64BV0
> >> > once SCTLR_EL1.EnAS0 is set. Happy to write those and the KVM change
> >> > once you're ready to post this.
> >>
> >> Thanks for the offer, that part is definitely not my area.
> >
> > We are preparing to post the Microsoft Smart Data Accelerator (SDA) VF
> > dmaengine driver for Microsoft Cobalt SoCs, which uses IOMMU SVA with
> > direct EL0 ST64BV0 portal submissions carrying the process PASID in
> > ACCDATA_EL1.
> >
> > Now that Fuad's KVM guest FEAT_LS64_ACCDATA series is queued, are you
> > planning to post the host ST64BV0 SVA + EL2/KVM patches as a standalone
> > series soon?
>
> Yes, sorry for the delay on my side, I'll try to get it to you ASAP.
>
> For my understanding of your requirements:
>
> - Is that hardware using an SMMUv3 or a different type of IOMMU?

SMMUv3.


> - Do you have userspace calling ST64BV0 on the host, guest or possibly both?
>

We are focusing on guest VMs first, where guest userspace calls ST64BV0 on
the portal mmap'd by the guest VF driver (with bare-metal host follow later).

> > Either way, we have Cobalt hardware with FEAT_LS64_ACCDATA available and
> > would be happy to test your patches on silicon, or help put together and
> > carry any remaining pieces alongside our driver series if you prefer.
>
> Sounds good, thanks!
>
>     Arnd

