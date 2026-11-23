Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291E4606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Nov 2026 11:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=YVWLb9Mj;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ta5HkjwI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Js9pC7jeiLo17zQaZ18MlpnQNslFBrPydnPaVDBRGVs=; b=YVWLb9Mj9vhVdq6w9wr+um5STA
	BfOsl269AhC408kCEs6pa7Q4CiE3TY8BwhnJW2INQHgWK76ygivhUaXN4qdo8eUyCawgpRMcNP7j2
	AtO3Tv06f+xUpDax2h8LhCgGy21hTmAwGWydv+YHlS0AyDFDpVAoOPqphsS7VBDOBr+Njx6seePJ/
	jinnPWioZC2U4g+aZhzbJBUMgCfj8q0J5N8YG8bp1qQCzcSpuMNKvO/KTpr3zMYLg/Img3oPzICEP
	+eq0WzLer4HhVx8uwMWSKnCYt45wFpNBjZv1FEr6K0Cy+ugKFd7QfOl+yFrPB6sX5zJW9CuU1aa0d
	rFhwjhPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSC2-00000003Av7-0kPu;
	Mon, 23 Nov 2026 11:26:42 +0000
Received: from out-1.mta0.migadu.com ([2001:41d0:1004:224b::1] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVSBQ-00000003AYW-0Cko
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Nov 2026 11:26:12 +0000
X-Envelope-To: linux-arm-kernel@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=ZxLBiXZ1NUZ1MFmbtMflV0tJeuN9FWz7PunWy9rzBsg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795433162; v=1; x=1796037962;
 b=Ta5HkjwI+4WdEKmO2dRzIBQoxePpFy191qlXhmQwfFbqeeEWHzK3yNwcuRleg3EAi06RHMVQ
 qv1pD8supKmP0j6vV/wHyTyQRl8AzB6f0wzviKAAuku15mFoeIqbVxEC2snxKpkG3Vi9nxWFXcC
 NQ7i2cjM6mlomlHOPSQhfSfk=
X-Envelope-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.migadu.com with ESMTPS id d7dbd3324f9b12f6;
	Mon, 23 Nov 2026 11:26:00 +0000
X-Mizu-Trace-ID: d7dbd3324f9b12f6
X-Migadu-Flow: FLOW_OUT
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5be58ad9600so9919e87.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Nov 2026 03:25:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEIN/VbSES6K6t8f4bc3DuORt9wJZQLkpuhT5PKUb54g0kV7KZv7ouy/ZxX2mdR485aRVgHgTJzHuhjCe6jaHXy@lists.infradead.org
X-Gm-Message-State: APuU4Z9kIBQfOgC9jAArGa7qHV2eRarKXs5O/7VHeviGIUhSvzpe8fku
	FEGyFdZ1SLXrMhBhi1mf4I8ktIu5vg+AHVecB9bi22+6emHLvv5Zruw/3No5XDKpFofi/nSOujG
	5KDRU7PpL/hHmr5U2X8h1/oJUXNoDaYfLgfLdKhJs
X-Received: by 2002:a05:6512:3502:b0:5c1:488e:a067 with SMTP id
 2adb3069b0e04-5c200ba538amr163953e87.16.1795433155472; Mon, 23 Nov 2026
 03:25:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123075219.369042-1-fuad.tabba@linux.dev> <20261123075219.369042-10-fuad.tabba@linux.dev>
 <20261123112218.20959-I-seiden@linux.ibm.com>
In-Reply-To: <20261123112218.20959-I-seiden@linux.ibm.com>
From: Fuad Tabba <fuad.tabba@linux.dev>
Date: Mon, 23 Nov 2026 11:25:19 +0000
X-Gmail-Original-Message-ID: <CA+EHjTx1AYw7SzWpv=k8ahrKnovaftP8rC7_GHx2g+PZ-cjXew@mail.gmail.com>
X-Gm-Features: Aa3M54q04K4Vkb_xge3irgDfROZAKGCFM3lbfFzE09aj0suM-WV_djSD8CzF7iU
Message-ID: <CA+EHjTx1AYw7SzWpv=k8ahrKnovaftP8rC7_GHx2g+PZ-cjXew@mail.gmail.com>
Subject: Re: [PATCH 9/9] arm64: sysreg: Reject a bit position written with a
 leading zero
To: Steffen Eiden <seiden@linux.ibm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Mark Brown <broonie@kernel.org>, Sascha Bischoff <Sascha.Bischoff@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_032609_106261_604AC3CA 
X-CRM114-Status: GOOD (  11.42  )
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, 23 Nov 2026 at 11:22, Steffen Eiden <seiden@linux.ibm.com> wrote:
[...]
> > diff --git a/arch/arm64/tools/gen-sysreg.awk b/arch/arm64/tools/gen-sysreg.awk
> > index 057dc98082b5e..01b463e271cef 100755
> > --- a/arch/arm64/tools/gen-sysreg.awk
> > +++ b/arch/arm64/tools/gen-sysreg.awk
> > @@ -102,7 +102,8 @@ function parse_bitdef(reg, field, bitdef, _bits)
> >               fatal("invalid bit-range definition '" bitdef "'")
> >       }
> >
> > -
> > +     if (msb !~ /^(0|[1-9][0-9]*)$/ || lsb !~ /^(0|[1-9][0-9]*)$/)
> > +             fatal(reg "." field " invalid bit-range '" bitdef "'")
>
> The test is good but IMO the error message should be more precise to
> what you are actually checking. sth like:
>
> fatal(reg "." field " non-decimal bit-range '" bitdef "'")

Ack.

Thanks again,
/fuad

