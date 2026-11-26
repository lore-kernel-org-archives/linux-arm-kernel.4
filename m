Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45936606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ePp/myGi;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=DafvuNQI;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Hy8wsJJu
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Xe0tRFQ6oz0C6PHY93xA0SxlfYSQl1kZj6MPIgpGjrU=; b=ePp/myGiEI8G6lqZTB6pAFJ5El
	d1313Q3N796LcWtrF994XIeBIeyHKN0+a8wh/Aqw99kLUWQ+Mjd+1tzByww6SNj4aFjeimE4WQKOX
	p7hz1QXcdmUXGLWNMnGlaE3Ge1+HeY1TWeZxucZTV0F7HhmzC6SZn6T++oXvsTck4TjV78rkRZqX4
	b+2BPrcxoa+0faCHhp92bvVYPDC58+MXADr0QAe7MQyPZIQi/uv6zXmKzOa5GkYEVoYJNlfsxbtyO
	5alt8EakbchxN1O9VaWHXMP+DgGZ/Z2Wq6YDPc+YTyrPWZDcoumSIs4rmDd84dVR6oV9jxszNNY47
	fn3IJAgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgBV-0000000ETo5-2tq8;
	Thu, 26 Nov 2026 20:35:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgBU-0000000ETnc-1K7F
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 26 Nov 2026 20:35:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xe0tRFQ6oz0C6PHY93xA0SxlfYSQl1kZj6MPIgpGjrU=; b=DafvuNQIhr4H1p4408FijYtkP+
	mXxmMn0tQmiblmtA0LuqP/kUiKBdOV0bwKOY65HsgG3bHsKBMM7NiwEUMLCFHJis7kQjfQOAqAemh
	UEc4+2h6/0kri9fDew+gQPpZT8nzm5zGb47GTaEmsMo9OTR5FGiPIlLoBobxoIONXMgXP3CtSe3gT
	kJ7/wL+0sG2bgKUuxx86NVPG42VWMZHBZg0ixtsn75fc3XcqZHOWrdg+xT70EfOKgzR65syoMEqO2
	1ecF5VzaUgrMydhXyptAe4Xk17ipj2li+9wltc9qgiBONUYyhp3XTLvrzKJUoCbDovWjxDxJQqFqq
	zPxSmvoQ==;
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by casper.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgBR-0000000CEaq-2Tbd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:35:11 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-491846221ffso6498136f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795725307; x=1796330107; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Xe0tRFQ6oz0C6PHY93xA0SxlfYSQl1kZj6MPIgpGjrU=;
        b=Hy8wsJJu/br/5X7HEeck7L3AkluCYwh5X9zDW1L6w06SZFkX2q6guUIQW7v+Tl0VPy
         TIHSUy65VItXX59J5efdo2/sYSQRCpep1Tl3+rVzvLiDRG3BwSWbHMd58T1qb409quk5
         x8tYwMpR/7r3B5gGpPg4TP8t3wdTu59+Ddw40YLd7Ak/8Ks0n4iCJh4fRXz66CDRAf22
         MbRkt4yTW5nZcyE4YpY2rf4X2+qwdQNfaMYEEVXYzhRfo1/+sPO7c8FQL8RqAnRvMRj8
         k2LSbz4vu4jbfwGSgY+m6OtZQJED2ZfF/NHdhhhmMicW0/Q0vid7BYPcQDVWI4RZ3Rms
         ejlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725307; x=1796330107;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xe0tRFQ6oz0C6PHY93xA0SxlfYSQl1kZj6MPIgpGjrU=;
        b=mROW5qfAp4p+E+IMMTga9kaMB2Rzqmx4+bnbRYMOFIe1tunvWUxX5gyOYA13XePVYn
         NM9Tk9+tVzAa5XF00iFi1Yj7h/O4GeobM2PrIAFiDFiN23t/9RHh/i1iqmZcgSIpSAJm
         QjNeyb/W+v5ZVJYfgQrMHl7IjIzL5EoiwC/meAqkLmi/gTM+vDBrxWZP59YlTBLiP2sy
         9Zsu66KgbfWOGDGl/PlAm69MUM6u8CQWN7EDRVJzUkiPb7ItQgZf01JRuvkAXruA3pQY
         AtDT6GAo1VsAzCX5/Ue3lnIuOp3O36K56Kg+CnBC5KDpdhj/Ilp4Vq3/qHGvnSwwJGgD
         uDmw==
X-Forwarded-Encrypted: i=1; AL+hErGsBzlD2gq0CJgnSkseIQw4jtb2tlLQXEr/Xsi34BmlGmFY9AkzUUjuwnUa+n6+pdw6//RPzg5AmtkUeL2xBkpo@lists.infradead.org
X-Gm-Message-State: APuU4Z95Kfzn9ZQpuhdk2M+UVY3qE95hqTQhLNkh+ll0Ep96VjsQ5QDC
	6tDV14V1TRzF+zPeTQvZLiVC7SCMwzVRB1XuQ+jKDmOeQeit/YnZJOXlbrIiOgy9XA==
X-Gm-Gg: AZFdTZe7KkbkmjYodNYSg7OqiVXZl41tM614L2EklYox9XMfl+NZcY2dvtMAvqVZLY1
	Dc5y/fZPNeGZpHQp8UdEFahY3fzmZL/PpuNOK5jaahyF6muRMg4M2CrT8Xrhn2asHiRht5MnxA3
	qjrjY//3VWr2lkqfwfVQ7lUHxLAl5SLtBFqcsX1jODoeaB2lyUksahW230StMd0Ng2NqAICk70K
	IUca/qgY6AYzXJgVK9E85uFAYQMQup2UZBdMHwT/U39jIV4p9/zmvVAH7F8C9mtsQ32ybSudXE/
	s+U79F8ZjPm/tgPKsVcmwlxnnq95Hd8M61WiBBci8Yue95CJJYjBdxk2A3wZ/wSihDLixHPqKFS
	UK+zQieoSjBdCPAHFAzqj1OvS79Jx2k5jzfLYeo0SHdhAk60GV/N/P0q+zJELOcuvCuKECywadn
	JVAd2jXimZNf7xPZ2G/rP5EvYo3R6U2rQKK+hMWrZWwoKZwL897gRh9owq7F2i7UYsOUdkVaPrV
	mdPY9r/gYzluzsh+ZazEVG00rmKE64DfiDAHkVkzJCm7R/yxYIioq+E6i+HOCXeiFvyf5oL4BrE
	5Yc1DFUdd5/11AvP7Lv1tncDkJ5L0aExaV5Uv4EZVJIAcoi/OLefKCqRuRfTliuqfBrwXCsAdbB
	LCfTM4Nj6yYFTx0riFwN50Q==
X-Received: by 2002:a05:600c:19d0:b0:4bb:ac6c:de67 with SMTP id 5b1f17b1804b1-4bbac6ce1aemr59511575e9.14.1795725306615;
        Thu, 26 Nov 2026 12:35:06 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9066f6e6sm298463905e9.3.2026.11.26.12.35.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:35:06 -0800 (PST)
Date: Thu, 26 Nov 2026 20:35:01 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Will Deacon <will@kernel.org>
Cc: julien.thierry.kdev@gmail.com, kvm@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, suzuki.poulose@arm.com,
	alexandru.elisei@arm.com, andre.przywara@arm.com
Subject: Re: [PATCH kvmtool] arm64: THPs for systems with pages bigger than 4K
Message-ID: <awiX9cEDByf7d40x@google.com>
References: <20261019145949.1922019-1-vdonnefort@google.com>
 <awhZk3NrkqeGvQxC@willie-the-truck>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <awhZk3NrkqeGvQxC@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_203509_643986_4142D260 
X-CRM114-Status: GOOD (  18.08  )
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
X-Spam-Status: No, score=-23.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Nov 26, 2026 at 04:08:51PM +0000, Will Deacon wrote:
> On Mon, Oct 19, 2026 at 03:59:49PM +0100, Vincent Donnefort wrote:
> > The THP support imposes an alignment of the memslot userspace address to
> > the size of a THP (PMD_SIZE). To do so, kvmtool overallocates the RAM
> > size and aligns it. However it assumes PMD_SIZE is 2MiB, which is only
> > true on 4KiB page systems.
> > 
> > Use a huge-page size, based on the system page size. This value can be
> > massive for a 64KiB page system, so skip the alignment if we couldn't
> > even install one THP.
> > 
> > Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
> > 
> > diff --git a/arm64/kvm.c b/arm64/kvm.c
> > index 36b3284e4a92..2c01dc32fa9a 100644
> > --- a/arm64/kvm.c
> > +++ b/arm64/kvm.c
> > @@ -18,6 +18,8 @@
> >  
> >  #include <asm/image.h>
> >  
> > +#define HUGEPAGE_SIZE (PAGE_SIZE * (PAGE_SIZE / 8UL))
> 
> Does this invoke sysconf() twice per invocation?
> 
> Will

It does. 

How about I use for PAGE_SIZE a memoized version of the existing
host_page_size() function?

kvm/util.h:

   unsigned long host_page_size(void);
   
   #define PAGE_SIZE host_page_size()


util.c:

  unsigned long host_page_size(void)
  {
  	static unsigned long page_size;

	if (!page_size)
		page_size = sysconf(_SC_PAGE_SIZE);

	return page_size;
  }

-- 
Vincent

