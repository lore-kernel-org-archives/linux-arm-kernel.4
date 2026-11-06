Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16AA0606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 14:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ifJyC1Zl;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ny7fxAhB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MStq/D9u6Lx4oTKrqyqI051eSh/8eE2W/WbUq/37lgA=; b=ifJyC1Zlel1GX+nLnyV0KDHjmH
	cdlfbfIkwiqxhJHwnkNe47RSxMNJfo7/xu7T2J8utqty/sEKZ/IzdcTMq+wc/ONJM5mlPig0wWxX5
	p8bFOTrPGT9r5unojW8X/XFDWYg4MxBG5v71pwApv0fPzLQ4zoUabGeC62mXiMnBSJt6bv7ftXplB
	8O1C5fHukvanCnVUfrJ+xj0NLIdKPcHUx+emKGR02zFUq+4V2U3Yvb/qBzRIzH0aL0MS76KQz5rMA
	44UZo8C94cfyixFuxrzZwS33WON1PjaEa+0BoTidb5A6UIToEJYiXcniQxVBLrwOW1n+MUZvu5Q02
	CNgx66Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL7U-0000000Chjg-0OzW;
	Fri, 06 Nov 2026 14:40:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPL7S-0000000ChjN-2mME
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 14:40:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BABC9605E2;
	Fri,  6 Nov 2026 14:40:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EAA41F0089F;
	Fri,  6 Nov 2026 14:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793976041;
	bh=MStq/D9u6Lx4oTKrqyqI051eSh/8eE2W/WbUq/37lgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ny7fxAhBTpi7dWdrqN5kHkyZfumRtV7WSw/qtzbOWGic0DyP4Nw+nicdgg04U0HjY
	 hWuzOdDH65K4P7TfKwW79ZqLF+jI6vKkkqKmptEVXwYPEO0cpaUTx4Zu5CzCwXg9YV
	 rf7Iu8e6q2eNp+hTpTw+s6dgumD1tq3vdRgILZ5155X4fZC8F76svL26IQHAsPAgTI
	 hIkmwcR+MbbYIIlk0DiET+VhaLyj0NqO6yIn7LuucalP//52dY4Ni3RJva5C584ddh
	 1DzhvtYotc4EnZLiKWzQhxJkjLx6a3716FBdZHeLLR022Oci1ItrOylFtozHosmmrY
	 PK2GEkDVvHthw==
Date: Fri, 6 Nov 2026 08:40:38 -0600
From: Rob Herring <robh@kernel.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] ARM: dts: arm: Another batch of warning fixes
Message-ID: <20261106144038.GA340121-robh@kernel.org>
References: <20261105-dt-vexpress-dts-fixes-v1-0-66615c3c8ec3@kernel.org>
 <20261106-outstanding-turtle-of-opportunity-9fafcb@sudeepholla>
 <CAD++jLmYJM3VhKN00CjpRviQ4Zfr394c2o3xqZPqEZnq9yz-ig@mail.gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmYJM3VhKN00CjpRviQ4Zfr394c2o3xqZPqEZnq9yz-ig@mail.gmail.com>
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

On Fri, Nov 06, 2026 at 02:41:20PM +0100, Linus Walleij wrote:
> On Fri, Nov 6, 2026 at 12:03 PM Sudeep Holla <sudeep.holla@kernel.org> wrote:
> 
> > We can remove vexpress-v2f-1xv7-ca53x2.dts because it is highly outdated and
> > relies on an FPGA tile setup. Replicating this environment is likely
> > impossible since the original bitmap files may no longer be available
> > easily.
> (...)
> > > Rob Herring (Arm) (7):
> > >       dt-bindings: arm: vexpress-sysreg: Add "mcc" child node
> >
> > I assume you will take the DT bindings via your tree.
> 
> Me too.

No, please take the binding patch too. Otherwise you'll get transcient 
warnings (I'm sure you check DT warnings before applying DTS patches, 
right?).

Rob

