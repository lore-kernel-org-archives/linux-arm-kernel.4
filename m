Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577A8606A680
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 10:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=t9k97Hxw;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=KqbAKYDO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=mjm0GDmjR8K/Ju3MP4eLIfUNOTpU1ZPQQpSc56ZDZBU=; b=t9k97HxwboEPaeqhYYZoxk2ZsM
	HgeC3/lobj7gRu2okZ8qJDHKFUiB4z550G2FEpWNKbwjMqVGqnMzCfQWmHB32+lnakO0uVwG4UXAd
	UpxTxeZB8SjJooE7bD4xe3G84BxMvSZJ0jHr/WoTxCKFi1NYKUBL3K4aq5YI4Eb7hsW/LvSquufZX
	qIwnVLfXkWiKKxVTfYMLLma6yq0/qcjndmiqXLPHmGXd/HavS6GCBDoAgQeVviMCw/jbvk5NL9i60
	GC81GU+4B4wCM5+5a5wukK0mtp/T2+lOsbvcC/2LJz0h5oz+hqbHBmMzwfNPYUO1JfvioLXMVvu4Z
	Qyr2rOSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRab-0000000325g-2fkY;
	Mon, 23 Nov 2026 10:48:01 +0000
Received: from out-50.mta0.migadu.com ([2001:41d0:1004:224b::32] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVRaY-00000003242-37DI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 10:48:00 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=i4faPMWfnpUZpn5ks85jG3d8Yrrr4l90SRdH3e+stJs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795430875; v=1; x=1796035675;
 b=KqbAKYDOCpEu4PRDlWHztrLxpUtmCLF4De5W6iNp82LMYoLuDiTWO/nPVKpiM70x5L8WWI6A
 Q0To4DABf/P9GPVq42SSrdL5snwHJEz4Z91GsqVyTjOnagBi2mTefqlOhkjz2sELB83CsiKxgGQ
 t/I5FkUK6h74DoveYflnemyU=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id 39bae28fe0f1a696;
	Mon, 23 Nov 2026 10:47:55 +0000
X-Mizu-Trace-ID: 39bae28fe0f1a696
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be58ad9600so9577e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 02:47:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFGF8tIc52r69s2piSRuo2Ksk6IZf8pMx1d69Zu8Nt9SmxlRVZbm9aBpwQRs4VdyflNAZvxQAY2Ieh86yoq3Fg2@lists.infradead.org
X-Gm-Message-State: APuU4Z+BiPdcpwiyG5Ppo5w2md1fKs0k6H8Vx5HcdEmhvihkSXHbzuyf
	95ntBXjwccBTvZqmQowtVp+1C6CHg4DsAXShwoCWMnAkIQ1zGA9O5QS7hexm8S/jkZOayORD0KD
	6iGvUGJbx3hiwAmXtOS54AO+K/3fcuLwuvLxbAxD3
X-Received: by 2002:a05:6512:b9e:b0:5c1:5209:5a44 with SMTP id
 2adb3069b0e04-5c1c8239441mr192922e87.4.1795430874687; Mon, 23 Nov 2026
 02:47:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123075219.369042-1-fuad.tabba@linux.dev> <20261123075219.369042-7-fuad.tabba@linux.dev>
 <20261123104553.20959-F-seiden@linux.ibm.com>
In-Reply-To: <20261123104553.20959-F-seiden@linux.ibm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 10:47:18 +0000
X-Gmail-Original-Message-ID: <CA+EHjTwSPZVSaHU9ABkLWDo3ic5cnK+qKAvHwFXkL-fo=0Sq1w@mail.gmail.com>
X-Gm-Features: Aa3M54oL2BJio-i_jjl1UatQuxbFZV0PJ4u8kL-K8TbxzfcAij-VPrnefcylYno
Message-ID: <CA+EHjTwSPZVSaHU9ABkLWDo3ic5cnK+qKAvHwFXkL-fo=0Sq1w@mail.gmail.com>
Subject: Re: [PATCH 6/9] arm64: sysreg: Reject an enum value not written at
 its field's width
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_024758_987743_EB598E14 
X-CRM114-Status: GOOD (  19.86  )
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
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Steffen,

On Mon, 23 Nov 2026 at 10:45, Steffen Eiden <seiden@linux.ibm.com> wrote:
>
> On Mon, Nov 23, 2026 at 07:52:16AM +0000, Fuad Tabba wrote:
> > The generator emits each enum value as written and doesn't check it
> > against the width of its field, so a value wider than the field defines
> > a constant the field can't hold. The duplicate value check compares the
> > strings as written, so 0b01 and 0b001 in the same field pass as distinct
> > values, and the rule's pattern, an unanchored /0b[01]+/, accepts 0b12
> > too.
> >
> > Require each value to be 0b followed by exactly as many binary digits as
> > its field has bits. The one enum written otherwise is TS, a two-bit
> > field of TRFCR_EL1 and TRFCR_EL2 whose values have four digits. Write
> > them with two digits, which leaves the numbers unchanged.
> >
> > Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
> > ---
> >  arch/arm64/tools/gen-sysreg.awk |  3 +++
> >  arch/arm64/tools/sysreg         | 14 +++++++-------
> >  2 files changed, 10 insertions(+), 7 deletions(-)
> >
>
> Lets split this patch into two:
>
> 1. Fix the bitwidth of the Enums
> 2. Add the new check to the awk script
>
> Then the fix is split apart from the enforcement.

Ack.

Thanks for the reviews!
/fuad

