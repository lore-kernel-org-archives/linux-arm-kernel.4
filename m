Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0377606A32C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 16:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=XNafZeYe;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=NWbACTL5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qNp1q27pSiTWfYgGJSTKqOtkXv+RytUsmXHc6vFuLzY=; b=XNafZeYeMMcX3caHFxCugvMhps
	LvHomM5HtWu8oL8LmeXOKoitn0nViYuvTCL3rElKzD/FkVrhrDF9VK0KTfm6PZLd7lAP7PppWtxCZ
	dSqIFpkSq410zYQ1rQmFf5nmPuknB1/6uw0hdyIduVkPXU1izPREHYQ2BblcFprsGEJLXM3IxwAq1
	N3T0A4zZLjZJoNtmMnUowwdesl4HJv0IKH+AYK01qNg+NV6QK4AaZzZnshceKQT8VJnWObGnnH1Dm
	gUOyW59agLZJZcQE1idVrxyQ15Ea70ugrJaVrE9bJp+IlDFouifz5JCUE62Shc9rfswAXhAJBiY6C
	ZdYIZvLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzrL-00000003Jya-1NKT;
	Mon, 16 Nov 2026 16:47:11 +0000
Received: from out-188.mta1.migadu.com ([95.215.58.188] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSzrG-00000003Jwc-0xBg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 16:47:09 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=qNp1q27pSiTWfYgGJSTKqOtkXv+RytUsmXHc6vFuLzY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794847624; v=1; x=1795452424;
 b=NWbACTL5TjFUpQcCV5hNKmYqRw/SogWUQ2GAgjyCHOV+ll6+j74Nyt2GwVPLZxTIJv96X/Dn
 htA90sl98AnFMvKNM2dvz55WFxZweYpkgRb+vK7jmxpP4lgsrh7ZvKf9T59o5zxjVoJa9Vsxm95
 zNuF9czddpAQ2IxCWDdeTkO4=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 7cbd6731a368eb31;
	Mon, 16 Nov 2026 16:47:04 +0000
X-Mizu-Trace-ID: 7cbd6731a368eb31
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5c00d7ac49dso9973e87.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 08:47:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGhuDDbghFYjG1fQCq2MX37kLz0VRAynnVEDGu8P7ReBUtp3t638KOB6+HR3DrupAXL79Gjit+jY3SJ3ZKOZ93W@lists.infradead.org
X-Gm-Message-State: APuU4Z/dYTgisMEeDMMYSFMzILPr30rMpMHH0ktXcci86KCVFLiEQnCx
	v1QM3T/Hc7UphoILxzlwOJ9eYQNWzGAGT+mLa6Nkdg/fhjKMf130VUyNyS980+L9zRTKtt1t1TE
	Fj4iIv8MNHYhsCZHjPEk6QIGo1H2K2yA0f2E5hLOZ
X-Received: by 2002:a05:6512:2312:b0:5bf:ec8f:c361 with SMTP id
 2adb3069b0e04-5c17e46b73fmr254876e87.14.1794847622967; Mon, 16 Nov 2026
 08:47:02 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116110549.1863653-1-fuad.tabba@linux.dev>
 <avro44jUWOARFzul@google.com> <CA+EHjTxWuiyjmUc3vH_KxRtS_3oX5w=CE76LdsLcrqC+RzLGfg@mail.gmail.com>
 <avsNdPissIDAb1hA@google.com> <CA+EHjTwuvhAPWje63TJRR_d+VHT0xwORktQ4zxrcV7KMaHxupQ@mail.gmail.com>
 <avsygB0HdGxR6psB@google.com>
In-Reply-To: <avsygB0HdGxR6psB@google.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 16 Nov 2026 16:46:26 +0000
X-Gmail-Original-Message-ID: <CA+EHjTzZAWPv99UF_2jKUteF=ZvhfWqBJx=dHi+-tFxBMoUfLQ@mail.gmail.com>
X-Gm-Features: AclHuK_WgZd3Hq9hZ3t4qbB4b45pul1ULpwp4wH19UYyqHf6wDD32zLK2i7M2yE
Message-ID: <CA+EHjTzZAWPv99UF_2jKUteF=ZvhfWqBJx=dHi+-tFxBMoUfLQ@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261116_084707_206636_B3D9FD36 
X-CRM114-Status: GOOD (  10.64  )
X-Spam-Score: -2.8 (--)
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

On Mon, 16 Nov 2026 at 16:42, Vincent Donnefort <vdonnefort@google.com> wrote:
[...]
> While I don't disagree with having the memset in CMOs in the guest, I still
> believe the hypervisor should do it as well.
>
> Linux is not the only virtualised guest and they all should be able to trust the
> hypervisor to do the right thing for them, which it doesn't.

I agree, and I think that that's the consensus [1].

This fix is for the guest part.

Cheers,
/fuad

[1] https://lore.kernel.org/all/20260923130031.GE1540250@ziepe.ca/

