Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46911606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 14:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Cx3FaQnE;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=oUQWunDC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=gK7mnV0K5J5AZlPsKO/qnVm94znB+xyRhSHaNfoCvBE=; b=Cx3FaQnEDAmGa8
	r5KPK4lGWpT68yhZ4AGz6VbNdXK2WSJksNjliV2PBrckVITrBFb5lULKpPXpZa2AHZki49r2ntUnp
	c2dUtNIqtqL3rY4KsHK1BwoZN9ZfA8m9DN42nlwXtPaWf5HY2KJCvrFifW44PCdLPlgKopfwoMlgR
	tckdqaBrJ7fBI0US1X4XgwSylOhTmfw6tDxEVRC7+CXxEW2JH9JyPIhg3pfmfpDzNUAoE6FcZCYxP
	SFeQW+e66YDDtMI4/GS1K6evK2Id6RxVqg6YGvphj61aPp0jf6KbF2/wfnVeKo/Ja8k7V5bdEbIEg
	tUCz4QUkaQXRs4VP0I9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxmF-00000002tZD-1uhk;
	Mon, 16 Nov 2026 14:33:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSxmD-00000002tY7-2KGn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 14:33:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5221940268
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 14:33:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372461F000C5
	for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 14:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794839625;
	bh=gK7mnV0K5J5AZlPsKO/qnVm94znB+xyRhSHaNfoCvBE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=oUQWunDCwyheDaHGiEVDZgcG4hWfvsWBs2QCkprHpw8MX67IaQUh2iYSe01vKYcAH
	 EiRQNzEtK5tKIf6j8E4MlHfl3jf8dNN03Hc5lbVcGvnw4Jda8WVhVo1oNXwJqApcpX
	 RpflSVlxikJEz+X+bPL3IK4vT/rAhmByDUcNfqz8ZRFSXPaUjxmkPJ1lrSk8VVXwtt
	 q1RnPDMxR7G+ThyE+k2pFnJPuXnU9O1vGElAalCLXPIyy4wsDXwd5ZEigUML0BDXjj
	 qVLD+Sy9Pt/E4BE2q/MsnLjD03qq2T1D99uUJcaNHKDE8I25RHxUEMZBZf0IZjafkf
	 Vdu56iSZ33gYQ==
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-71ad047710aso1375653eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Nov 2026 06:33:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGne3CdSVPaK42U13vocomwvAr5J0G1pPWTeQ3/khi/gSaN1CeLsBnG6AWdJhtzfiBEm2HB3Ynb3S7JayL1mFfQ@lists.infradead.org
X-Gm-Message-State: APuU4Z+pdDtW8ZriJrK1wQWN2zOMazZr9X3FEDRaK/gvqNvmd1gl7dUR
	KokI6U5QiSLATdjizog3MB4VesckIbKqli+YH4B17fn6lMqdQuFS3Gjx6sTlX91LNfvrEwCayqP
	61YDcJLKhSgqIw/WqjzLnWf6g5tVg03M=
X-Received: by 2002:a05:6820:c2c2:10b0:71a:facc:5a37 with SMTP id
 006d021491bc7-71afacc602amr779012eaf.63.1794839624591; Mon, 16 Nov 2026
 06:33:44 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116-cs75xx-gpio-v4-0-ad80a944e966@gmail.com> <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
In-Reply-To: <20261116-cs75xx-gpio-v4-2-ad80a944e966@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 16 Nov 2026 15:33:23 +0100
X-Gmail-Original-Message-ID: <CAD++jLnkP2MHE5MTggjqti2qxMvm=KCs+XeoNsrUtXbRSZfhFg@mail.gmail.com>
X-Gm-Features: Aa3M54rzZJA3A38fzb3Px9Gx86UMNQxM77NnKlrXCliGaLoeMKhrWBrxmYmn9Sg
Message-ID: <CAD++jLnkP2MHE5MTggjqti2qxMvm=KCs+XeoNsrUtXbRSZfhFg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] gpio: Add Cortina Systems CS75xx GPIO driver
To: filipp.dunsky@gmail.com
Cc: Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
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
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 16, 2026 at 3:08=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> Add a driver for the GPIO banks of the Cortina Systems CS75xx SoCs. The
> data and direction registers are handled by gpio-mmio; each bank has its
> own interrupt with level and edge triggers, both edges are emulated by
> flipping the polarity.
>
> A pin only works as a GPIO when the pin mux in the global control block
> selects the GPIO function. That is not part of the GPIO controller and
> is left to the boot loader until there is a pin controller driver.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

Looks good, use nice helpers and all.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

