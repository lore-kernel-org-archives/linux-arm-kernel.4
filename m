Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6180F606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Nov 2026 21:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eCwSNHfk;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PhcIcnDa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=v8vAHChTalJyPKJWjYAU8hJ9rNARiHKrkluyFMh0zh8=; b=eCwSNHfkiEewLx
	3TmwSHETAyMQ8oJlSvj/F9Mr7UxdKhsN3GEW6ZBk3ZLw2WSUf5MED5EfOSjBMb4zNpuLP0yXlFpDn
	Vc/CEcMVvkU9gV3TgZPqo4y8z9GtVdYtnw14kftdvunhje0vBAW0R3Gca8Bc31rfQmh1392Vt6zkW
	ece+ej4HNhlG2z1LHTK5UOBPrx/F1HAMLfjWZo6IgufI9Qy5YBaoeFwJzro1lfPW9rGZ+LKPuclTG
	Oenacr/n0fLtRWog/Gz4OpY6RVcIB8lddviSwrAg77H1zcQpkabYUbmqktzn618lys56+CmY8RCDa
	8yb39LzZW+b0LjWjcICg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDG-00000000IF3-0GKA;
	Sat, 21 Nov 2026 21:01:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUsDE-00000000IEc-3Pmy
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Nov 2026 21:01:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4898A459BC
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 21:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 154C81F000F0
	for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 21:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795294892;
	bh=v8vAHChTalJyPKJWjYAU8hJ9rNARiHKrkluyFMh0zh8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=PhcIcnDahk93XHX6nhVEyhzqPt5GML6+Zl8sQA0Ax2ohQ+5IT8DChhIUmK2Pn8qZI
	 pL6vyZZfGf9NWndz/ufGc9Y1eByB3h8etOTfGTkfMSB14pW1UtngpOIf/rL3RurMv4
	 a3fppe2SppuOI0uPoRo1NIUjKgbuBrQFlp/nxdkIUd56noxL6pZIFEtO60X9maoWoW
	 73Hr4fogCGQaWM1fmV9oJJsbGa7Lyz62RAEXQH7L0uBL3cYCCAJvOvYkoQLcXZawdV
	 1pv/4CFES8fTRs0t/4hf4Zr9LAsfZZwq7PtHj8AXZ8qNoQa5KhmxDWzWoeiccEJiqf
	 58mjFX/aM/xwg==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so1253980e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 21 Nov 2026 13:01:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGfcLl5qN73j98mfS18CMwLf7HTS3eUWpipcXRcGhVBnIgtTORjVQm3Qz33T6kTqNEhuYuP6iXXK8u/teHz+xsM@lists.infradead.org
X-Gm-Message-State: APuU4Z94ijNSulTMV3g1+i10NE8/istxXli11IQeutMUXac0D2q3Nl5v
	sRjVzh4gh3bHqq0v5Skx56NdbqCBfS/LiWDwwX377nXnbPLbf9/xYfTkrZY9JfZNF2adIQhtRIw
	fDMUc45LurwBE5VoRo9JCJksxCes7ygs=
X-Received: by 2002:a05:6512:31c3:b0:5c1:465b:ebe3 with SMTP id
 2adb3069b0e04-5c1bc7be4b6mr2356062e87.13.1795294890748; Sat, 21 Nov 2026
 13:01:30 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261015142552.4128028-1-ryan.roberts@arm.com>
 <20261015142552.4128028-2-ryan.roberts@arm.com> <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
In-Reply-To: <CAD++jLkrWojU3FeTPGOCFHHsbmTGYG0Tz3b2nrn7mMfsDssCQw@mail.gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 21 Nov 2026 22:01:17 +0100
X-Gmail-Original-Message-ID: <CAD++jL=fnRBZJ-H8SMbZDr_1-F-aRbq6QRN_ZqaKw_M4cJFBOg@mail.gmail.com>
X-Gm-Features: Aa3M54rcr2uec6946c6ceFg_f82syIk8ikAg7SN-MP8cTPlIYobsjIq52BzG5Cw
Message-ID: <CAD++jL=fnRBZJ-H8SMbZDr_1-F-aRbq6QRN_ZqaKw_M4cJFBOg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/15] misc/arm-cla: Add driver skeleton and documentation
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Alex Williamson <alex@shazbot.org>, Jason Gunthorpe <jgg@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Philippe Brucker <jpb@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Fri, Nov 20, 2026 at 10:47=E2=80=AFAM Linus Walleij <linusw@kernel.org> =
wrote:
> On Thu, Oct 15, 2026 at 4:26=E2=80=AFPM Ryan Roberts <ryan.roberts@arm.co=
m> wrote:

> What the patch series needs to do is tell us how this topology is discove=
red.
> I.e. will it be discoverable from the hardware itself, or will this topol=
ogy be
> described in device tree or ACPI for example?

Hm what about I read the whole series before replying to individual pathes.
It's righ there in patch 4/15, mea culpa.

Yours,
Linus Walleij

