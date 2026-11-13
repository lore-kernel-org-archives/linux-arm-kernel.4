Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCD760A2607
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 08:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=N8fR2Lxe;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kj6fSXOb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LGw1WVYMB7/uWOhnON2ZjpYzLsk6t5+hMJ8zM0UGs2g=; b=N8fR2LxeJph6xXkGP1nD38qmlY
	EGu2FFyx1Y5Yo1UYSX4mOHgZybamX8dNJgzoHaYHFexb54P/wOsg+lY58yhbeQOqTd3TqJJbPlXX5
	lS40TzqWLIA6pibOnznSWVi41UoZwxdVmr2v9FVV5WceODlqjagDXdM0otYYD46Ewrk3ZINdGIF9z
	DkA7zOJojGi/GYN/9viEksBFQ0RE7JQAPjqnwN+UIZl9ySikjbWKujdlkEUYN1ci3CMJ1DhnpzebK
	Gob2IQunmfEQEYDB5lJ6ZWU0S/YhbxtwdI9+i4PUghIFQ0+gFvUsz9HGbTeaD2aldI7dR76UCBUUt
	pW/EzZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmx-0000000C5P2-2u3M;
	Fri, 13 Nov 2026 08:37:40 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRmmf-0000000C5H9-0kOF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 08:37:27 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8b5e147f101so112758b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 00:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794559040; x=1795163840; darn=lists.infradead.org;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LGw1WVYMB7/uWOhnON2ZjpYzLsk6t5+hMJ8zM0UGs2g=;
        b=Kj6fSXObTxlUDtd7yoUbWLL1u0B/1By/K3AEpFidDSlriQO5D4BRQm70AIg0li048v
         G9loWIowQg1NjYusCvv98BsM+Q+EOcFXJNivLypPGlot7+oAjkQul/ZiTnKXk8tGIHtS
         o4t4VwO2KapyLtxHsodNSqVLjoUn6F0pDP805SqCct24IIvpKiuvPZkrw4CemPPfjRoA
         J+b0tVv8rqXVEMo9eqLOEP1OO7LK+cPHNAOvlOiqpO1niecscIfvhXAiVWinWd/H/0np
         7v9drhksfx4fddTXO7HZg3J9XdYjk5VVBaonC8dYu11xgUTq226Lw1VH/4xd3OUn+Bue
         59VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559040; x=1795163840;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LGw1WVYMB7/uWOhnON2ZjpYzLsk6t5+hMJ8zM0UGs2g=;
        b=1tH1BEVJ/V966gHxHVSTudrVt8G2mMuvRKhzgKt7Eu+G20Pqel7u8vvtAO6+87Ly+m
         ytvYbjxjGt25jU0LbPaezUa+D+l86ek0pxVMK2f+I2z6AmfUeORDJr/phERYsLrOjPFW
         mAP23/oe+aV9c9zmXvxpFtAdMG3lClAYSfzmFy1+Jc0+LqKGHTf0AHEV3WjWxNNA125j
         kcYxjqg7ZQUJcXCe02dtINHti7D1dCZM7BtI9rx+ivdJbcSC2O/U7gzExoZZJttZV5QL
         XwmWLeEIOEkQFBpNXh41AQ38aFYFZr2MOw21MPdugV1zNprKBuBnZhHrYb148ZgGlaY2
         ahsQ==
X-Forwarded-Encrypted: i=1; AL+hErFJB0DMKv1fjhdhmVzqw4vqVc71NTCz+Vc1ITcBNejtZYuDbVxhGXDTLU8LJ+goqjG5dOBkYzX05VW6M27wJOv7@lists.infradead.org
X-Gm-Message-State: APuU4Z8yeHc2VZ8uQu6Tn2R3XtmLXKnl2u3oM4m9fMAqSvaBcXH9HFSF
	wdvfdv+yBzeXSFsaGWeULt3Db3L2y6uh7FSBCzjpdoqSrSyZxIMHMCvUjNwLsyNm3Eg=
X-Gm-Gg: AYBFou3XfCa7GxzfIh0TlFgVjN+qs/VroiReJJb+W5/rgExsJe4gVgdSrXXkZQybBzd
	iBp5yKCgydyK2XXSKYJAhC/citV5wNrhx59PmVMyqGrsPGQ3BgB5aOI1j9+DNF4ac8c5sNo3OQM
	NS2jjYl1NCUgf3TSnKp7JduYtNQqn6fiEdsHfZzAYb3/NiLk8fGC1Bb86QWvZVyti3v0IAbat5v
	SEuKC+lDpuZngVtCzctabKnXn2SXYSP65OfmDVfACtHsqsAuca7GZsZ/ceUYwGM4+n64KxOnDX3
	oUP9dcFUq2heApFNt9oU4SV4QPchNQBTFMAZcwRpmAWoihHJD3EujCzb9Cuh4mxb6bRNp5l5h+J
	PfTEeLtXhWIHdAC7LWxt5nVnsFQ8Dh0Dgo5R0qVWr7A4J7HQ7RqgJ+iDt+2hZ5xyada6U6RqbNM
	vFpz8H+32Ji/iD4QVqTiR+7sP2zmG3sg/IamZUlyn8/ps5lKAdKkFUOGsTuj+aaE9QOfVuPMt9g
	zi9NSxod2jhwHFErnZE3kNfmSVsp8S2lcyJ39zHDNekTuCTfN/Dhyk2BiRsASrj4LcLHQ+DaucB
	JGlrwAks+bh4+pDSklVtkZ7usMniojLAoBFImpiktInnBa+m44V2Hc3WIuJsr6GLaWLj5SF4+0Z
	LEt0MO2D3ufZ6I6XrKmfCqzmvES4=
X-Received: by 2002:a05:6a20:eec8:10b0:3e2:2228:c62c with SMTP id adf61e73a8af0-3f7a74c090bmr1701640637.2.1794559040122;
        Fri, 13 Nov 2026 00:37:20 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed1a6db53sm747372b3a.21.2026.11.13.00.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:19 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
 Nicolin Chen <nicolinc@nvidia.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 00/16] iommu/arm-smmu-v3: Implement Runtime/System Sleep ops
In-Reply-To: <20260929034510.2023173-1-praan@google.com>
References: <20260929034510.2023173-1-praan@google.com>
Date: Fri, 13 Nov 2026 08:37:18 +0000
Message-ID: <179455903885.2418534.14656921897583011972@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_003721_334913_38768092 
X-CRM114-Status: UNSURE (   6.19  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
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
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Pranjal,

Tested the system sleep ops on RK3588 (Orange Pi 5), MMU600_PHP, no
power domain in DT, with USB3 and GMAC translated:
- s2idle x3: OK.
- deep suspend x3: the SMMU loses its state (CR0, GBPA, STRTAB_BASE
  read 0 at resume); your resume path restores it, USB3 and Ethernet
  work, no errors. Without it the SMMU would resume in bypass.

Not tested: runtime PM, MSI restore, CMDQV.

Tested-by: Arun Iyengar <aiyengar1990@gmail.com> # RK3588, system sleep

Arun

