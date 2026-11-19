Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1474F606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Nov 2026 11:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uIyjhqip;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=HXGXImHs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=2nIoNXWOUAVdWDRzGFpmLJqy+h9+tgXL9koPRtHTTIo=; b=uIyjhqipSwM1/Qa/4c7UDpz6F0
	jYq5oktcC5YY/ressVA/Fer73Bcs4fk19FOjfLA8kvaGCDOZqSRcwjCcOp4Ix6OtfxF7HBmprWfL6
	CSyO53AKmQehiKwCs6PwsI6z/O0NB8MN82RKtv2N2epT0tp3jivg/fbrdUGyPpJ7Oj1J1+3y7Vpyh
	F8IRELHOJCNACYm7EhMTD5oKMaT9Yllsqkfi0zIoJRNxum1xE0Qv4g7qPpjbv8PbxhIBijpEfAx9Y
	UACUJINsvkOLDKmS3QI9DRSe4HPKN6qT/zm8l9p25m7yTLUPX5enQnNjxZnRlAMxIjv74nBe1iJu2
	DS9imQoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0fl-0000000BkV8-2AbE;
	Thu, 19 Nov 2026 11:51:26 +0000
Received: from out-13.mta1.migadu.com ([95.215.58.13] helo=mta1.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xU0fi-0000000BkUT-2uk4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Nov 2026 11:51:24 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=2nIoNXWOUAVdWDRzGFpmLJqy+h9+tgXL9koPRtHTTIo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795089079; v=1; x=1795693879;
 b=HXGXImHsmUKRyCJVzfs4hgVRIceoWSAWK0KnA4H3Al3VntL/dXUjQ7gVS632EplLqafnqLLq
 D+wFZt7mgebrUgYExZPCEj3F6tLlaSf0e/A3CltPO5XBLigqq/0Hd8fEIc+HrjbOyq4im4U+Wqo
 P2D9cPbdc5B+ayqW7e6q40d8=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 60ff17e7c48051a4;
	Thu, 19 Nov 2026 11:51:19 +0000
X-Mizu-Trace-ID: 60ff17e7c48051a4
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5c144eb2f43so5395e87.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Nov 2026 03:51:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEHmK3PquDBcTDcmMPyC0EmqAgs9693Xiy01AfQ1dbbpmiX9LwqX0rOjc4QKZtZFzlITbKSWA1qFVry+hnGxuO9@lists.infradead.org
X-Gm-Message-State: APuU4Z8mu3H4UWGh1k9R9aDplNWCGPHYvHm+HI4/SIiR17+xnmZrbHLx
	UB38q1087ovtCeLw2a8eg0iurPO9s6Aj7KJjPlKtUIExTInnKqCz1UvpG8kAmelZJzqiKvPV+ZH
	lxibJv7VrQ9mYsAK5H1JeHTyR8LwTs7B//s2+j0pm
X-Received: by 2002:a05:6512:2249:b0:5c1:ac5e:ee43 with SMTP id
 2adb3069b0e04-5c1b4d8e751mr72133e87.3.1795089072968; Thu, 19 Nov 2026
 03:51:12 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261118-host_gicv5_fixes-v3-0-13c1859e8aa3@arm.com> <20261118-host_gicv5_fixes-v3-2-13c1859e8aa3@arm.com>
In-Reply-To: <20261118-host_gicv5_fixes-v3-2-13c1859e8aa3@arm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Thu, 19 Nov 2026 11:50:36 +0000
X-Gmail-Original-Message-ID: <CA+EHjTxyzmrs_MmyR+mgd2i3o+WsCJXUDeFYMazx90HcMsRpcw@mail.gmail.com>
X-Gm-Features: AclHuK-9X4wNiG1y-xKQhxxJly3ETEK_fLVXFOqR8mr1PAHRi6qTd8jcdmWzIk4
Message-ID: <CA+EHjTxyzmrs_MmyR+mgd2i3o+WsCJXUDeFYMazx90HcMsRpcw@mail.gmail.com>
Subject: Re: [PATCH v3 02/14] irqchip/gic-v5: Only set IRS DPS when 1ofN
 routing is supported
To: Sascha Bischoff <sascha.bischoff@arm.com>
Cc: Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, Timothy Hayes <timothy.hayes@arm.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jonathan Cameron <jic23@kernel.org>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261119_035122_990655_94D638C2 
X-CRM114-Status: UNSURE (   8.07  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Sascha,

On Wed, 18 Nov 2026 17:35:31 +0000, Sascha Bischoff
<sascha.bischoff@arm.com> wrote:
> IRS_PE_CR0.DPS is RES0 when the IRS does not support 1ofN routing.
> Read the capability from IRS_IDR0 and skip programming DPS on systems
> without support for 1ofN routing, rather than blindly writing it.

vgic_v5_irs_set_up_vpe() in KVM writes IRS_VPE_CR0.DPS unconditionally
too, and that bit is RES0 when IRS_IDR0.VIRT_ONE_N is clear. Worth a
separate KVM patch for that one?

Reviewed-by: Fuad Tabba <fuad.tabba@linux.dev>

Cheers,
/fuad

