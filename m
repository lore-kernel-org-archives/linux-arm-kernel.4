Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71B0D606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Nov 2026 23:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NH+FyfJj;
	dkim=pass (2048-bit key, unprotected) header.d=sverdlin.org header.i=@sverdlin.org header.a=rsa-sha256 header.s=purelymail1 header.b=MlnVnObC;
	dkim=pass (2048-bit key, unprotected) header.d=purelymail.com header.i=@purelymail.com header.a=rsa-sha256 header.s=purelymail1 header.b=JvEiBCCF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=+MzJUlSHy4eYz8k3I9+Z1/DrWgXW8jRa6k0Wz5zf8Es=; b=NH+FyfJjmxUi06GLfP7XZ6jNWT
	5ajDJqh6xqFmZo2mdpGYw3Ebh8ppGuPd6A9x5Nqsty8czR+Njy9gqNuJzfi69Zr5W0wAxmeYe1DW3
	JRm8K2wnaGAsEo+Fs3sxnqK/rV8M1X95hhiIAOhEdb5DuBSfmhZbRVE5GM472mQfWo9uEhCD7bpsb
	8EOIryug1ZjWwgfam/PIRiAk+Tm54WphzFsbvSW5CUZVM+pF73RDpXJJpt2NTp3SGEiONaGGif1BB
	awjDE52DbQl7XncI8jHuVV2ucRjWTXRFAjfyDY5tGG9Xmo2Int2eHEKwdGQSqSYY8UzmdFNOPuzCc
	xDhO1RSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSY6-00000007IKB-2Uqt;
	Tue, 17 Nov 2026 23:25:14 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTSY4-00000007IJI-0cgA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Nov 2026 23:25:13 +0000
DKIM-Signature: a=rsa-sha256; b=MlnVnObCBZqCH2kEZrNce4+p2hQJguBuSDf8535IEZP5uq06sRAfiUmr/+4Nqsa7zgV1QwthqQhCc04HYH5d3bj+ND7fJlcJ/RSS+tkzsklu5Y/fJ7EYlxVgK91F7M/E6WueJSxpv45nRMKzUqC/AJaX+tBPFuGxfaoH75pIbaEKnixb0ik0+HLT/DlBasFi4pMBHueb4CptYHo0eiwpwF9owjdOD0gjQWXoTJMbUulOPEC9sJ8uYuxwBPfrlc2I/nV2S3OAxCVhT8DgBXAS4i4ySbBnyESH00Fdl7CDDkEyGYl8fAhOAaCNIoK4ME/PzqPBUaGunU+rVpIhTY1NIw==; s=purelymail1; d=sverdlin.org; v=1; bh=+MzJUlSHy4eYz8k3I9+Z1/DrWgXW8jRa6k0Wz5zf8Es=; h=Received:Message-ID:Subject:From:To:Date;
DKIM-Signature: a=rsa-sha256; b=JvEiBCCFFI3HmL0ydlTlgWrchv77khmsFsDOYPbA7OBa9pAjlD5aSS//gQvsNgsbqgHnecjlVV9zO7d4OlUWUHBmQibjGww6PvlHxMnXrZI21ChoR8EzljicFg7dd332o4tEmefs/5ZDe/PuhmRITGFVUjxYBSEh8ROlFoOSAzsL/rsdcXgGP4cpMJjcrZY3kKqWFJXQmdpZiCfp1xveOr24t2womp0ehxBcADJRp8/hlua9RuMV4XHEKv5UQc42SiP7g1P8KNdcZUX0RiqY4lOw6WP03VtoFDHMeWWuefFbTBp7vJLlUKkN//+Byz9A2VtFCSGHyUvw72gI2JJzXA==; s=purelymail1; d=purelymail.com; v=1; bh=+MzJUlSHy4eYz8k3I9+Z1/DrWgXW8jRa6k0Wz5zf8Es=; h=Feedback-ID:Received:Message-ID:Subject:From:To:Date;
Feedback-ID: 815097:39668:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Authentication-Results: purelymail.com; auth=pass
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 418562010;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 17 Nov 2026 23:25:05 +0000 (UTC)
Message-ID: <9957d8679c44e695e22ba86224e4f853a0a65217.camel@sverdlin.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
From: Alexander Sverdlin <alex@sverdlin.org>
To: Enzo Adriano <enzo.adriano.code@gmail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Wed, 18 Nov 2026 00:24:51 +0100
In-Reply-To: <f1da763aca9c4978dd7cd9a363548b5e53314656.1794227241.git.enzo.adriano.code@gmail.com>
References: <cover.1794227241.git.enzo.adriano.code@gmail.com>
	 <f1da763aca9c4978dd7cd9a363548b5e53314656.1794227241.git.enzo.adriano.code@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_152512_251126_CD029009 
X-CRM114-Status: GOOD (  10.48  )
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

Hi Enzo,

On Mon, 2026-11-09 at 23:45 -0500, Enzo Adriano wrote:
> Document the Radxa Cubie A7S board and Allwinner A733 SoC compatibles
> for the accompanying initial board device tree, so it can be identified
> and validated.
>=20
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>

Reviewed-by: Alexander Sverdlin <alex@sverdlin.org>

> ---
> =C2=A0Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
> =C2=A01 file changed, 5 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documenta=
tion/devicetree/bindings/arm/sunxi.yaml
> index 28437c47ac01..37a7d713ac71 100644
> --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> @@ -857,6 +857,11 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: rad=
xa,cubie-a5e
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: all=
winner,sun55i-a527
> =C2=A0
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Radxa Cubie A7S
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: radxa,cu=
bie-a7s
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: allwinne=
r,sun60i-a733
> +
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - description: Remix Mini PC
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: jid=
e,remix-mini-pc

