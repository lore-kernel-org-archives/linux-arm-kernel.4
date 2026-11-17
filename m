Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0C5606A333
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 12:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Yk9ndjDv;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WqogBRVW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=; b=Yk9ndjDv5VcxahVO0YCEB8ibRt
	GyeO3SPCwiLYUCY8NCR+1xBMqRJVhy+YGUKT++0MNKLqf0tbAFHoQ8FmfisHUfxYEwHrwmvFbU8zm
	9gf1lU1Bzc7nl6HebsQV1YwC6haz1p9ksH07ZKLWvqc8XQD4aVjpeTcJuLi0n1xsFoxha+Az0LEIq
	vfQFfeHbnn+AzScpC61Tk8XdFOkEalOu69hduXQYD2Xf9Mdc4kAbLsDg8jlZrXpW20x+r7HNB4UmO
	Y8nL6BnxQUT6UiX4MiIQimCjibrCrRrUuug0TGhcEvOlCtIlnhBEzKLL3YK1jFM0Ok/DCZrfev8NZ
	WHCJjjaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIAN-00000005bf5-0YF8;
	Tue, 17 Nov 2026 12:20:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTIAJ-00000005beG-0kRu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 12:20:00 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-6b87a240de3so365012a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Nov 2026 04:19:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794917997; cv=none;
        d=google.com; s=arc-20260327;
        b=JMl1j6FHOHbAbkqH+dNysS60JpJrBPJJ7dnYAMObSqX3KKbZ1QzM+KDVGhTZQQ8eQK
         c73e64DvexCQ4U3L5xve3LewzQJ+8l4EUvEv5l4AilNiFl7izmobUGYtPXcqzVNgQ+B/
         6o7j4YrhucExCtKuUb9PDFEpcU0ipvi1EckRVCGQqm5nm89PYFhLZPSSYj7B7m36sJSK
         267SIVxetrOcgvF1y9JZkQxqygcR7EBRzC2OfpPFzznS//9AeM6DbGG6vd+H0MciApKX
         wQ2twg9X5C1TUeuc+kUAUW2kW/ltf+UfVAav/6B5NoUJAa+vvYkXqLh78LVzjICbj/Tn
         LJ/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        fh=bxzIy3t1nDurdmNbz7elpqTyJkYbsam/uf/yEJkQdv4=;
        b=f9EU4T3rcNxLhig8e92mWOqM63QJ727am+nIpZyTvVTXaXlLCHrrPj/T08RHckAJvh
         EEia3hYaZxFVnbzLJ2R8Ob3yoMpNkvk7Wf9TegfLjOzDjODO1xMI9KLSPCocqDPffI0h
         XO7MNrlm8vCDVMKdx5omR/w8o9ztq/JdE80FXfeNdtKoQDbIE0h5Cj3XUVzmJMOj84Fd
         w9gplSnzX3pKCpe7WYRhLV0xPynt4ASWNskvZLjw/ZWy8oREbdQcc3OAWnKNJpTX2x8c
         tt8jcWIas760geHQSsj3caNN7Vv5XtPNecfGCPjuX0uyJgxfgYFjgnbIiHzJXrUPVOkH
         p2qA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794917997; x=1795522797; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        b=WqogBRVWrvpYHn5pnDwVPma4s5L2emZWSTb5mW/kbF2JtBPunswldxiznnC8oriUHP
         QrbOj3Nddw5fzc5/llpJBHu8OP0oQ2UKhhkrXEFH4GGh5lq9BZKKp21k1R3GNuaZT+6c
         SvaH0r8yXgN5a121a+XyWnJFyuX+j8W2oBS6liCDD4g75jnOTpsUfC655De9W3CSCzoj
         uL/YKOepTs3s1j3hKieho035JPsGXC4dkzGTNUsH71LSMVstiaanDzaGoFjGILmGJqP5
         kJW2+9xLhaFm0LI9RGqko6MqOu8a2qryo2WtGZxKsdimlIRMsstyhQ/ncIxiAhlTXUqS
         cGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794917997; x=1795522797;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ZFVJi+i+sc9nYgluytKQGXSriWb6Sc1xPMl64Y6JsfM=;
        b=ibo0GgoBqnnsnq0j5HrtsSUZoeh7LJBFbOZ6t2IgrvaURQQLyNVzproIp3XMZvwzaS
         sytblWOvxquaOggKILvpICthW0cG/Er9OPH89yo2SvbgDsBw9E1OhgFJoO0KaRv/y6Ga
         jysrxe6EsJmlUqHpmpJzMObP6VrmkOmxy5Au0QVx2joCuySPiJSRLAmZGYckl1igkWLP
         kMNbbMyY8pTh0Z/N9fYmW5GrU0GRS6q+9HPMq+F16zPCfSebNyEAM3FCVfHQYU/PnwHf
         WquY65eMa0VIiOmRqk05KrbEPkbUsU7R/RbBhpOXFTObwwLxyGmq6QaOnq5M9el7riVg
         QqIg==
X-Forwarded-Encrypted: i=1; AL+hErFvrqfjvjtdyMwtCpiMkmueGm4BFOsrbvax6fdPuK1qZqTXIhHgqH90AwrTCVU4vld8NwYuQEi7jIUDGKxC8umr@lists.infradead.org
X-Gm-Message-State: APuU4Z9V1+lnufRLkelX2s1F/2gny+DFeCgwpqCJX1BB7IRcxT8gdWYP
	ZI8SjQoF8FamNezNFGxNwqL0YxwY5AzuZ7B2zD4FSFpuyX9zyrZx54u0drwxOGdxPh9CAgQjZfR
	Ot+KNeBzh3ruhfrzQeMzgCIiKT1kbe/+0ZPIZw0l+fQ==
X-Gm-Gg: AYBFou3/ARHSIgmmSkkE9w/7k0N+M6Qh9120zvDXuYeDSPK038rSYGbvDLyVbJHsNzZ
	Ut1EuxfVb7jLR4GGPQ6eIqd5EgdoALxdCO2sWIM4yd6lnqSJnitbosAtQs+2tm9ZIvD0w/JIGR6
	lfOoubTrRbeSZe+jrNXHVhOoSdNVBJjhG+RXKp0VD78RYtp14cvzv3ae8ag6nFQNa5Xfc6J4Epq
	yVaCi25dVIqnBKdjWoxgfOcZbszAC034TiHmAlaDd3zmFn3hG3KRU+n9tyLXbVEAezRtBZn291d
	gaFQFBa4BEBnnD7YwE1WJpfgL3F/t5oFhk3gAmVsq5zD6d2NM5krLcS6z6MRvY8wr1o4tciGKKp
	6GpaBQ/edKYxnuv5/ABRCPffT/GCv7A5Nzml/q1paX06ZtyTg25oWeUvJNROFyeBWCSyhBR/rG9
	LP6m/C8oH4q2sm7EIH
X-Received: by 2002:a05:6402:1ed5:b0:6b7:e861:8f50 with SMTP id
 4fb4d7f45d1cf-6b7e8619543mr6865668a12.37.1794917996838; Tue, 17 Nov 2026
 04:19:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116-b4-iommu-passthrough-devs-v1-1-dc5b493f7551@linaro.org> <20261116174238.GC2299285@ziepe.ca>
In-Reply-To: <20261116174238.GC2299285@ziepe.ca>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 17 Nov 2026 12:19:45 +0000
X-Gm-Features: AclHuK_ulY4P51VnkuhR_K0XogE5A7oe02gNjInWa6kLbfDjJ1Wh2QAX_5471Bc
Message-ID: <CADrjBPpyhKcvdH=jxiGSN46SZoFahaBdH4fAQ5KEzRvH_C3AJA@mail.gmail.com>
Subject: Re: [PATCH] iommu: Add iommu.passthrough_devs early command line parameter
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Mostafa Saleh <smostafa@google.com>, 
	Daniel Mentz <danielmentz@google.com>, Juan Yescas <jyescas@google.com>, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_041959_246080_407F4C79 
X-CRM114-Status: GOOD (  15.00  )
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

Hi Jason,

Thanks for the review feedback.

On Mon, 16 Nov 2026 at 17:42, Jason Gunthorpe <jgg@ziepe.ca> wrote:
>
> On Mon, Nov 16, 2026 at 05:37:45PM +0000, Peter Griffin wrote:
>
> > Instead, I propose handling this in the generic IOMMU core via a
> > kernel command-line parameter. This makes it available uniformly
> > across both Device Tree and ACPI systems and across all IOMMU drivers.
>
> Something like this could be useful, but also Leon's series will allow
> userspace to do it from the initrd too. IDK if that is more/less
> interesting to Android.

Could you point me to the series you are referring to? I want to be
sure I'm looking at the right patches :)

>
> >  static unsigned int iommu_def_domain_type __read_mostly;
> >  static bool iommu_dma_strict __read_mostly = IS_ENABLED(CONFIG_IOMMU_DEFAULT_DMA_STRICT);
> >  static u32 iommu_cmd_line __read_mostly;
> > +static char iommu_passthrough_devs[IOMMU_PASSTHROUGH_DEVS_MAX_LEN] __read_mostly;
>
> We can allocate memory at this point.. No need for a fixed array.

Will fix.

Thanks,

Peter

