Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EEE8606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 15:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Q0IPx5qh;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mEcequ7l
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ECU2TElv91yxQnOvgc867H8L47o3wHkMu4XssOR6zp4=; b=Q0IPx5qhFw2jzzDZycMaJsUKQQ
	0k93mAaGnJrABLEVlxYbCj9Im7KRjQa/rJgro1N1zWOKcMw9gKNGvfJeE6GwQcdWSjiq+FbkBCppU
	DcI5deAZqEQFzfuhPS5X062UWHw32Uq9NMvQP9AO303BqayO2IFHLRmwqhvu/VpLu91oF/dbh52bb
	wcOo5heQ51Ub6ka/Daj+mmLcs2DR7kvGzl7bBcZ1sxbDQg7TVRZI0kloG1Y6XurUHB5/smY8yMuSh
	MMnwYGD2y/DC81VtE5mZ/bRYXqMy8P4bFtqfckGjmQWg6Q0LsYTzmG3zItvdMdnII/Vzk+pxWue8W
	B+9C62lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRslq-0000000DHib-11Eh;
	Fri, 13 Nov 2026 15:00:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRslo-0000000DHiO-3TmO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 15:00:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E6F3462471;
	Fri, 13 Nov 2026 15:00:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 657881F000C4;
	Fri, 13 Nov 2026 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794582051;
	bh=ECU2TElv91yxQnOvgc867H8L47o3wHkMu4XssOR6zp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mEcequ7lJSY0QqmebgyYBL2GVsiv3FYw/JOKPUTDI5HDXixYS6ovbYXxqZvcL8N5k
	 aEOwBGO72ci2H9mHCLHcszDgGwxlpA32YyUN10eWL2aRs/N40CVeZM33qg6Sk9RZpk
	 X051Th5jZ37nOT/KqB1wOJwc+hT1nLCW/EZdePgikIwD1WZt79l57FhuoSrRcWguRl
	 JF9OZXYVNaVgIlrJa1m57hWfJ+CDdbo7upeHd2Q1aUQiR6woEX3/u12fsgOY5CBeDG
	 Ju9fHJ+XZ0vHCSr6gdPFK35z9GOmOvpIvzkvtkzK4SG3e05e4zgorUgxbkJ4jA9FO0
	 ys38v0vVQoqnQ==
Date: Fri, 13 Nov 2026 09:00:49 -0600
From: Rob Herring <robh@kernel.org>
To: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>,
	Navid Ghahremani <ghahramani.navid@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: cache: l2c2x0: a disabled node is
 left to the firmware
Message-ID: <20261113150049.GA903773-robh@kernel.org>
References: <20261112072953.989664-1-isasmendi.agus@gmail.com>
 <20261112072953.989664-2-isasmendi.agus@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261112072953.989664-2-isasmendi.agus@gmail.com>
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

On Thu, Nov 12, 2026 at 08:29:52AM +0100, Agustin Santiago Isasmendi wrote:
> l2x0_of_init() is about to honour status = "disabled" on the L2 cache
> node by leaving the controller alone.  Say that the firmware must then
> leave the cache disabled: the kernel does not check or change its state.
> 
> Assisted-by: LLM
> Signed-off-by: Agustin Santiago Isasmendi <isasmendi.agus@gmail.com>
> ---
>  Documentation/devicetree/bindings/cache/l2c2x0.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/cache/l2c2x0.yaml b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
> index ee604117ffb3..15b5d8c1ebdf 100644
> --- a/Documentation/devicetree/bindings/cache/l2c2x0.yaml
> +++ b/Documentation/devicetree/bindings/cache/l2c2x0.yaml
> @@ -24,6 +24,9 @@ description: |+
>      early secure boot code. Thus no need to deal with their configuration
>      in the kernel at all.
>  
> +  Note 2: A node with status = "disabled" is not touched by the kernel at
> +    all: the firmware must leave the cache disabled.
> +

No need for this. That is the expectation of any disabled status. The OS 
should treat a disabled node like it is not there. CPU nodes are an 
exception.

Rob

