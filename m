Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7F7606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 19:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e/dLV3nh;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AsulG3y/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=yYqZFzMQG84g0Prc7XiHjijfNm+nzCSJFJoOZTXl7Ww=; b=e/dLV3nhL87i8tYaTJZ+YJvTgW
	hR9tjjA/S/0tXZigH2TZ4Ap1k9hJN2sAR++qZwWbizekaTzLDCf4OJna4fVUHndxjFAg7tDA/PAhq
	jMLgg9KUioQNPIBkYdDyYH76c0rvqqN8178itT2lSign9v5NV7NaSuPCmFP9TSX0Wx9Q5NuTHdRJ7
	6FqMCVqQwPF1A3DU3A5RvwQAL9I3neO04N5zto9XHTchD9UGZSAC6uQKPsbjmKZQ7R5JASrUg9Hw+
	+pQ6M8Q2twlErs2kSJ/pslMVXwSK8Co+5m1mUsyr/zkFryr+0quYHDo2HNwDYTtmCXPx9ZhFm3Yr6
	cwNSLlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfcS-0000000EPYq-2RqZ;
	Thu, 26 Nov 2026 19:59:00 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWfcQ-0000000EPYD-3SHu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 19:59:00 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4ba013938d7so69838525e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 11:58:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795723135; x=1796327935; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=yYqZFzMQG84g0Prc7XiHjijfNm+nzCSJFJoOZTXl7Ww=;
        b=AsulG3y/y1Cmut++WLJ7mny9incbkgma9qUwNrq679zlEhOGCuZ8Xjk/ccM+sTFhPU
         t+ZX/tBafG4SQZt39+LoVKrqdfZSXdNaooANtizEU0Sj3A+MZEDHQQ5ULdM4atloDjND
         NT7rSiCkk+n8d5oykWSj2UAMILxLVynoZaS+1nAlQ7/PptQ30hUh4N1fqosGRDW+B7k1
         WGNnLuuSP+iNY142fyV/8nrVW+bU/2TkD4T2v7IwfF4OrFBOsQrgKDY3cCcEGAmPLtFr
         d6GpBe62GqBCV/gF8apwkC6+/P9cnYA9bdNxBDMfeGOAC5Gio0UfFuMg664Lz/2uaCAh
         iCpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795723135; x=1796327935;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYqZFzMQG84g0Prc7XiHjijfNm+nzCSJFJoOZTXl7Ww=;
        b=v7GkEZyfP0XzpY/NylQbYRfaDL8SubrP877/iVgA70VHiLI+6MLVSmdkgnhpGNV8l8
         oYUXYwUBTK4q/RQFcXVUT3/mxbMuiJYHRsrJxS0KGWX4eJdaCMpp+Q6zK/nPoXs2kxQF
         B75Uqx24IU/s3PFmX9zet6tQ5liA/JHPmnpPFgAtDGrkj6DMBxEaloUnNKPnNp4HYN3R
         j1pa/ix4Vc9HMMqP5VzNFoxH965sIQmKkFao5zJDBhUKo3ehlV2fRpJqpI9GLpjmJkh3
         lvbR8uwTOWfOrwwbntv0Io+5jjm/RMi9JCuMYelf+chMsM7NomnkUKAxrtHmNFMQijWp
         U2gg==
X-Forwarded-Encrypted: i=1; AL+hErFuTbsYf1oQCot26CWSWPz1n+9qYA5azL9zsBKCBNfTBNr6cItW4Hw3YHEqzb1rw1F+/qgBhlNV4VKkrKM20LJc@lists.infradead.org
X-Gm-Message-State: APuU4Z9DLFocg5SdvIXKrFJAutPESgT+zSIzZDQAo8ZkYLZxtEXKEXz3
	DK046rOmZHgcgcOf/Efi0MSzCdwzalcL0waYb4Wb/P4lHS4/hWSBK9S7uOzD9ifynA==
X-Gm-Gg: AZFdTZdg7LtJqOjb+mUqbzpobl2xY3sZGV8dEWJFPkuxiqyZaFAa34hLD3BiVkd41VC
	ae4K5L+v0uu3K6/vL+Exfd5nolIOGftIvOtnBxeEv0StE5p9cXXnOFzNq/DchJGPMua6tfuvXCE
	Dr0yOlvrFfpxMuHOmO3sSR4VMvaiDHCYsVhvgvSMfZlNkOv8UtS2psCkiTmjO9UUtaqQEh5l24u
	J6qiuEr6aJc9KiXvJAa843TH77TVSISka4Mq8hX8rz4nGgEnP/Tvc8+XqIg1AF6MkCoYDxZBIy4
	JXmu4mnJmqXnZB7a9Mo4v9zUTUl7LoVARLqR5Flf9zGqlYfsUyIfsmMToS/p2URup2MvcejWPgi
	6wsdxgfzaPzhDzHgyapNNFDg0k0F8PUdLrBN9Ifm8IZWLJ1QnOhVKEF8n62qqu3B3Fu2Ua4zojZ
	RiH8mgUUd2cPWaqVPAssfy3xFJm7VVzlot3rADsl+4xF2JWj3Xnq71xV6SP0y9cwyPreeUpZ8+Q
	p3rOIv7x8HaT/F6XTA6XVhT9tacYI/MapPmWkp1js1TEG0ohFhxJnJmavDD41LdiyT+9p6Jlprl
	MqZfaa1Z5kItI25gfahNG6Uj1rbj9P+RWc55I1Tsm63J+V80zMrvu+tvwn79JjJt5Sk87EqcXbF
	IK3Vcx5QTvQHorxjme0Px8uFs55yGwFlsTtibSbvMkMo=
X-Received: by 2002:a05:600c:4e4c:b0:4b6:5dac:b61e with SMTP id 5b1f17b1804b1-4bb88938d2dmr414850105e9.32.1795723134933;
        Thu, 26 Nov 2026 11:58:54 -0800 (PST)
Received: from google.com (0.182.34.34.bc.googleusercontent.com. [34.34.182.0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8533579csm543567785e9.2.2026.11.26.11.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 11:58:53 -0800 (PST)
Date: Thu, 26 Nov 2026 19:58:50 +0000
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	catalin.marinas@arm.com, will@kernel.org, kernel-team@android.com,
	qperret@google.com, weilin.chang@arm.com,
	Keir Fraser <keirf@google.com>
Subject: Re: [PATCH v4 01/23] KVM: arm64: Prefault host stage-2 entries on
 block split
Message-ID: <awiPetTWkhFXj_0M@google.com>
References: <20261117174403.58762-1-vdonnefort@google.com>
 <20261117174403.58762-2-vdonnefort@google.com>
 <CA+EHjTyCo3oUiRUeLQ_YStLAzmD8J8i1kJD4H8qYLyn5EHdp=Q@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTyCo3oUiRUeLQ_YStLAzmD8J8i1kJD4H8qYLyn5EHdp=Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_115859_056568_F9754F05 
X-CRM114-Status: GOOD (  15.69  )
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

On Mon, Nov 23, 2026 at 07:24:16PM +0000, Fuad Tabba wrote:
> Hi Vincent,
> 
> On Tue, 17 Nov 2026 17:43:40 +0000, Vincent Donnefort
> <vdonnefort@google.com> wrote:
> [...]
> > diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
> > index 9c83837b184d..dfbcdd3d91a4 100644
> > --- a/arch/arm64/kvm/hyp/pgtable.c
> > +++ b/arch/arm64/kvm/hyp/pgtable.c
> [...]
> > @@ -1053,6 +1095,9 @@ static int stage2_map_walk_leaf(const struct kvm_pgtable_visit_ctx *ctx,
> >          if (!childp)
> >                  return -ENOMEM;
> >
> > +        if (pgt->flags & KVM_PGTABLE_S2_IDMAP)
> > +                stage2_map_prefault_idmap(ctx, childp);
> > +
> >          if (!stage2_try_break_pte(ctx, data->mmu)) {
> >                  mm_ops->put_page(childp);
> >                  return -EAGAIN;
> 
> Should kvm_pgtable_stage2_annotate() end with a dsb(ishst), like
> kvm_pgtable_stage2_map()? With this patch, it installs valid leaves in
> the host stage-2 too.
> 
> Cheers,
> /fuad
> 
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
> 

Ha, excellent catch! I believe it works nonetheless because
__pkvm_host_donate_guest() calls kvm_pgtable_stage2_map() after.

-- 
Vincent

