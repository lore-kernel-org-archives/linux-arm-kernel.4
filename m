Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A68606A337
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2UAciC5E;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=DY011i0l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=PiHF220QlxLkv+FhGHdBRQS6RD228RAM8FakmbcJw/I=; b=2UAciC5EO1z3GhLw/FbLWPk+IW
	aRtDjPRVmooDkto00Ml5GsuAk6gqhMqOIfs6HaqRDlBMAGVtgc44gHdg60di8NqURWW3lWG5Wtz4n
	6gNRDZVJYiPDLdyz/ms321qdzPrD8dNYnM9MnbkYJ3wC+5MTmZold1bcLrLaiUuM8gHLka/kxkByT
	KUGxVFOVrusEvzJwycVnS2Crw4C2P9VLHQ4+WZzP6AJnB5IKoE1BPsieTxRMkvsZSq2odgG7b7c+g
	FE/v13Xokn9rmYLqfVw00yRnNpLHoHh+dFriL9DZPmBDZ9HcA88/aF0spOaWHHDket5zIOlnc8CXx
	PD5N0x3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0iQ-0000000Bklz-2qZS;
	Thu, 19 Nov 2026 11:54:12 +0000
Received: from out-175.mta0.migadu.com ([2001:41d0:1004:224b::af] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0iN-0000000BklM-0B08
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:54:08 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=PiHF220QlxLkv+FhGHdBRQS6RD228RAM8FakmbcJw/I=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795089244; v=1; x=1795694044;
 b=DY011i0lawxr3LnouArrklA1YLm8BgYWFOeakWZHLTfav/nusXVZ80hTUENVBB0RqIQO1qUi
 rYRNeRfkzXwup3FH8cGd+a4NEyNZS89e0aOwNJyv4cftAQn5xlH73vkHU4MkeH8M/Kvb1QKFl3V
 2UvYstirGyb06Iuih+Z85wFU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 235914d417570152;
	Thu, 19 Nov 2026 11:54:04 +0000
X-Mizu-Trace-ID: 235914d417570152
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5409e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 03:53:59 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGzHvPz361px8Y7Z/TDsfsSrXh06VcUM5GUcyBMhlEQaJJSjPHCzUaDrD1VBost+9tn/M8BIw4xXUD2mizOU7Et@lists.infradead.org
X-Gm-Message-State: APuU4Z/Hi2+91S8/GPAmvb7RK2C+tpwTNMTZzY4y6NxGGh/01mwoY2Vd
	jmGOZgiaK8KtDgelAF9uAK4l5SR2WsajNkLRSI2+R9u561GL3gu6JcJFJs7NmDxVzyLQdeqvgVM
	UGhgiM5zpwLyj5M+Jn40fjraPWJyWhVjvLKPFAAzE
X-Received: by 2002:a05:6512:6ce:b0:5bf:f81a:f24e with SMTP id
 2adb3069b0e04-5c1b6701822mr62577e87.10.1795089238356; Thu, 19 Nov 2026
 03:53:58 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com> <20261118-host_gicv5_fixes-v3-3-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-3-13c1859e8aa3@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 11:53:22 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwoP36opJYeZ6Ba4aLE8f5igZzW9+LSbuZkztr51bRdxg@mail.gmail.com>
X-Gm-Features: AclHuK_AZe_Vokv4qAU_qUJNPMBSmI_bbzFthqZ3V5RG14Q6YAF6hocR_sZcPPU
Message-ID: <CA+EHjTwoP36opJYeZ6Ba4aLE8f5igZzW9+LSbuZkztr51bRdxg@mail.gmail.com>
Subject: Re: [PATCH v3 03/14] irqchip/gic-v5: Serialise IRS synchronisation requests
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_035407_281106_C689AFDB 
X-CRM114-Status: GOOD (  11.25  )
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sascha,

On Wed, 18 Nov 2026 17:35:32 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
> IRS_SYNCR writes are ignored while IRS_SYNC_STATUSR.IDLE is clear.
> Concurrent calls to gicv5_irs_syncr() can overlap, causing a request
> to be dropped. A caller can then observe the earlier request
> completing and assume that its own events have been processed.
>
> gicv5_irs_syncr() may need to be called in atomic context. Serialise
> the request and completion poll with a raw spinlock, and use atomic
> polling.
>
> Fixes: 57d72196dfc8 ("irqchip/gic-v5: Add GICv5 ITS support")
> Signed-off-by: Sascha Bischoff <sascha.bischoff@arm.com>
> Acked-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: stable@vger.kernel.org

I don't think two calls can overlap in the host driver today. The only
caller is gicv5_its_irq_domain_free(), and since the LPI domain is the
parent of every ITS domain, irq_domain_free_irqs() holds the LPI
domain's mutex around that call. Do we need the Fixes: and Cc: stable
tags then?

That said:
Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

