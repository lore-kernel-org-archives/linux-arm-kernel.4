Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB900606A32A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Nov 2026 07:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2XrFFiFV;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=fWYrLnqw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MiacfnaMPJRiamD9j7Q9tZD9+VM45fmbPYHfHzACMSw=; b=2XrFFiFVI+XEQP
	CZQIS9ScsGbQSXSol/vEEY7fq0CPUpHD9YnBAoIg9WY0rdK9B/mxKZlyYZsnJ9ngGqXo8VHpXRvup
	kyeFfi5bVH71TTG83ia+xArYvVKhMDoPLbO1oTgaDevPAmkE8MhZ8aZGcu+jWPtZtSV3U2hYS8KKg
	2/P73Z7K5SzUj46RZDjz1Ht71HimVL7EhIJeNwHDFzluXRlVqyekXRcq8xSqzWeD4ADIHNzy8tf1v
	N20ImZuLmIXpnQyiuyOh7QhxOErfM97yg6kQxreQjw4Hx/Gdwxc57gtxV2q+3sXV3G9eMUYnT0MtD
	pOivqSNavfg1zPq/5SNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqpM-00000001MYm-1il2;
	Mon, 16 Nov 2026 07:08:32 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSqpJ-00000001MY9-0THL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Nov 2026 07:08:31 +0000
Received: from ratatoskr.pengutronix.de (unknown [IPv6:2a00:1f:f805:2b01:a03:2f4:308a:7b52])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 39A65200F2F;
	Mon, 16 Nov 2026 08:08:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794812903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MiacfnaMPJRiamD9j7Q9tZD9+VM45fmbPYHfHzACMSw=;
	b=fWYrLnqwUCpjxBfnfgvV9PzKORJVmnhE5udLvkoSMMMhd0v73SLtD4ZRQ/Z0Trf+0qG72W
	FdMykCWfVFIXPmet43Ct1A7WLsVBp+v8MVAvKv5n/O8CDyuBqP6U59T3XycVjFA5gmT7hi
	upuVFlO6+gnGLC4ttt5hNIiMkbGuKPmLXmeKC7VS5KTqAJbA62H9vF3+S/OaPI5OkcJ43H
	+Vnc/2Xj/uQsRcnktBfnnoeV+gWcq6pJ9xmPy3jGsY1q/dYsZTQhlJtPfb5/dCDkUN0DPh
	NRgRp1bpqPj2rCzEDPEsc11gm9nrULdY6gTpAllF7jzgio6IcQ3hb57xnUb7Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794812903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MiacfnaMPJRiamD9j7Q9tZD9+VM45fmbPYHfHzACMSw=;
	b=R9GM4t9lhTcS42Hi6uXLv6XP7qV+saOdhqtq6hTvIe39TFNIvUckzmA2hiOgWH0qe3P422
	046hJs7OKusRAhcTnhH9ab0ROXdmex+VM/WxxfxmJe+g2A/Ogp5rArX9rmfRFfLXXz/KTS
	t+fY/Lr7twEA0aDwpqsmC0eZrxCD7qmLufSn7QdFWdygxyCIx7LTCd+Qqss9ff/iMAQd2V
	FfIcbNALe7gUEa3JTglaQH092yMOVUkvFk9/cGGYr0mVuS7LcVFqWjlmwZlweP43rVT/wh
	DAxdRMYFDvSmNFUKzrZu+K3Dru7Yl22+F7mCuM0/FEd/SCZmvVSfgxBdGKsH6Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794812903; a=rsa-sha256;
	cv=none;
	b=PVU80Cq61LjPITdqRcGvG3c2Mmjn1J+3vdezUOk02Xx14FZY78PZY4DpdlRW3rKe6CrfXz
	ekrLzOO91Hrf404Q61mGjhaxNofwYIOcNAf8blha7e8WdrmYkGf74sd/Yi4PKDnn8F4gKV
	f4JXUX96yiDd8qdMp1oEe3VBgUzAxMCNXR6tAJuZSjfnuKo4GA8sRbSToW/rbmfbTYgels
	yrJbV2j3ul9mEX/Y6UNPqDI7/X46xlMPgeYkZg09i+CPxpY2KKjrGlxD4JQ4GJx7I73dzY
	3ULU/aUZZE2s1TQbCLV0N9fUrGMc+SrS70CfCEDrVmk46eazJCTbhid6xjOMLw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=str@pengutronix.de smtp.mailfrom=s.trumtrar@pengutronix.de
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
To: netdev-bot+sashiko@kernel.org
Cc: andrew+netdev@lunn.ch,  davem@davemloft.net,  kuba@kernel.org,
  pabeni@redhat.com,  robh@kernel.org,  krzk+dt@kernel.org,
  conor+dt@kernel.org,  afd@ti.com,  andrew@lunn.ch,  hkallweit1@gmail.com,
  linux@armlinux.org.uk,  michal.simek@amd.com,  edumazet@kernel.org,
  netdev@vger.kernel.org,  devicetree@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v4 1/4] dt-bindings: net: dp83867: add
 compatible and reference ethernet-phy.yaml
In-Reply-To: <179465553656.2199510.11430097651218280926@kernel.org>
References: <20261110-v7-2-topic-dp83867-v4-1-a268f83b1ec1@pengutronix.de>
	<179465553656.2199510.11430097651218280926@kernel.org>
User-Agent: mu4e 1.14.3; emacs 31.1
Date: Mon, 16 Nov 2026 08:08:21 +0100
Message-ID: <87fqx145ju.fsf@pengutronix.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261115_230829_308727_1B861642 
X-CRM114-Status: GOOD (  28.50  )
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

On 2026-11-14 at 11:25 GMT, netdev-bot+sashiko@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider.
>=20
> Critical: 0 =C2=B7 High: 0 =C2=B7 Medium: 1 =C2=B7 Low: 0
>=20
> If you believe none of the issues are legitimate, please reply to each
> issue of Medium severity or higher and explain why the AI is wrong.
> If any of them are legitimate and you plan to respin, please let patchwork
> know by including "pw-bot: cr" as a separate line at the end of your reply
> (one such reply per series is enough).
>=20
> - [Medium] This patch adds `select: properties: compatible: contains:
>   const: ethernet-phy-id2000.a231` to=E2=80=A6
>=20
> --
>=20
> dt-bindings: net: dp83867: add compatible and reference ethernet-phy.yaml
>=20
> This patch adds a compatible for the DP83867 PHY ID, with an optional
> ethernet-phy-ieee802.3-c22 fallback. It also adds a select on the PHY ID,
> so dtschema now applies the binding to nodes. The $ref changes from
> ethernet-controller.yaml to ethernet-phy.yaml.
>=20
> > diff --git a/Documentation/devicetree/bindings/net/ti,dp83867.yaml b/Do=
cumentation/devicetree/bindings/net/ti,dp83867.yaml
> > index 4bc1f98fd9fe5..2cd8311ece5e5 100644
> > --- a/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> > +++ b/Documentation/devicetree/bindings/net/ti,dp83867.yaml
> > @@ -8,7 +8,16 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> >  title: TI DP83867 ethernet PHY
> >=20=20
> >  allOf:
> > -  - $ref: ethernet-controller.yaml#
> > +  - $ref: ethernet-phy.yaml#
> > +
> > +# only the PHY ID, not every PHY with the c22 fallback
> > +select:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: ethernet-phy-id2000.a231
> > +  required:
> > +    - compatible
>=20
> [Severity: Medium]
> With this select, the schema now applies to every in-tree node that has
> "ethernet-phy-id2000.a231". The binding still ends with:
>=20
>     unevaluatedProperties: false
>=20
> Several Xilinx ZynqMP devicetrees set #phy-cells on their DP83867 nodes.
> For example, arch/arm64/boot/dts/xilinx/zynqmp-zcu102-revA.dts has:
>=20
>     phy0: ethernet-phy@21 {
>         #phy-cells =3D <1>;
>         compatible =3D "ethernet-phy-id2000.a231";
>=20
> The same pattern is in zynqmp-zcu102-revB.dts, zynqmp-zcu104-revA.dts,
> zynqmp-zcu104-revC.dts, zynqmp-zcu106-revA.dts, zynqmp-zcu111-revA.dts,
> zynqmp-sck-kv-g-revA.dtso and zynqmp-sck-kv-g-revB.dtso. It is also in
> zynqmp-sck-kr-g-revA.dtso and zynqmp-sck-kr-g-revB.dtso, with two PHYs
> in each.
>=20
> #phy-cells is not defined in ti,dp83867.yaml or in ethernet-phy.yaml. With
> this patch, will make dtbs_check report "Unevaluated properties are not
> allowed ('#phy-cells' was unexpected)" for all 12 of these nodes?
>=20
> The commit message says:
>=20
>     Reference
>     ethernet-phy.yaml instead, which also describes reset-gpios and the
>     other generic PHY properties existing devicetrees use.
>=20
> That doesn't seem to hold for #phy-cells.
>=20
> The later patches in the series keep the select and
> unevaluatedProperties: false. They don't change these DTS files either, so
> the mismatch is still there at the end of the series.
>=20
> Should the series either drop #phy-cells from the Xilinx devicetrees, or
> allow it in the schema? It looks bogus on an MDIO PHY that isn't a generic
> PHY provider.
>=20
> [ ... ]

This is fixed with the patch from

Message-Id: <20261110-v7-4-topic-zynqmp-dp83867-v1-1-04500475a560@pengutron=
ix.de>

which is already applied to the xilinx tree.


str

--=20
Pengutronix e.K.                | Dipl.-Inform. Steffen Trumtrar |
Steuerwalder Str. 21            | https://www.pengutronix.de/    |
31137 Hildesheim, Germany       | Phone: +49-5121-206917-0       |
Amtsgericht Hildesheim, HRA 2686| Fax:   +49-5121-206917-5555    |

