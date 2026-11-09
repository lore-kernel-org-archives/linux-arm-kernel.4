Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA022606A322
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 07:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IyWhEuJ/;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yko6w6I1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=; b=IyWhEuJ/TUO8Ke
	W14xvVDJbUf0jTQeyR10GbmnN4BYYVWP9oLDup3iPLWTRpcyc1c2037km+JimdXABLEKxZKT1VBp0
	p29I+U0S5b3sl0QCBQHp0mZiLjHRiPPiqyAd8o7QZDfM0Vf092cHvRrysM4kiXPGlq9XtikHjrz8v
	fRqlqDj4eT/Iv0G6jaflNe1Is/aNO5YeP1L7V1fS6QruDdK7/dCXzetawMhO5YCMLeuS9ls/LrQ7X
	Z4gx1XAqBXt+UXcfiDderltJJoqQOaFAb2rWlMa8rajHl0vVXg9A4cIYHTum7+o17WYJjTFhGMm2p
	wmJ2Yvax71fk1eSRwt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJzu-0000000HaiF-38RN;
	Mon, 09 Nov 2026 07:41:01 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQJzs-0000000Hahp-2lXO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 07:40:57 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-cdb2893531bso274777a12.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Nov 2026 23:40:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210054; cv=none;
        d=google.com; s=arc-20260327;
        b=LBZeQGizM0Lf4oSftAxovblRN1iUZOo4y+8tv8GEsxy84rEEtHyVhH3nFawRrKpV6+
         wwAZEGrWkdJWWQpazUBM2JqI0lHNsb3Ypi234hg5O5pQF5bUt+LJ+8bgPrloxF1isp//
         sEW6SqgnsLnCb4bEDLxv9ozGU4HmnkICYZQ4cryXXBpF+CdbTm0R6F2IAdC8hnorsJVB
         kKlQ+wdy+zcctnxDlPedqKOp4EG/2uiciAj25aJyIBDmLoNAPrT+xmUnkK2uOtl/BVzS
         qf1WEY9hbZn2lWC6rHvC5ukLiOjPaRi3foChWPdH4ExoAQeYJW+XYsKlUOn/AD/oQnlz
         jLcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        fh=+G8P9fV7Pt3TOnlDL3Gy8lblKedjgGjaW97Ff+p8QPo=;
        b=ArPo/RvSklXHoIIkxcv4rlOsRcZJYrW33R6fnSQV0R6bHsGZdNy7sNDlau+B7dLCB8
         KvltgtbdK5QIuOxzrBFMasCLIjzFWAVMoLO/5KuQOgA+Y6Os2hzgtPlccetbOFVxDKVU
         CQhTdLt1RHCXpjg15/fpwHeXyEJ5GwZE26oNMJJ41M/NTpsm2dAqfKuo9mXhjcF2jlhh
         XlZNH9QvpIHtynVt0TK6y+EvwSLJL7ON7qmcXgO7gRo8MoXihIIYRkqdZf10VNyvlyxe
         jvj7XekR9ZjdFjamc7PGsfTIZ9tm8aoL7VWQgDbLlHX1SX7cUcfmEB2ygm3fKJVFXDqc
         gNqw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210054; x=1794814854; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        b=Yko6w6I1RlneyM6UtTtlT05pVvLjutMDP10gTRKOIWjR2Do7lbgWxTOWnNlaA2nutA
         Fg4AsZDn7GwlpNGy4tE16tvKvItZEroxMtjlUEPy0FN/Z1S+1Qk0DixZZjc5GTYBSD7g
         rXN7f0OpuIRD4vBqHnyFZgUhyNOBFBYNPhSCA/so7sx3Vac/2kgbtd3LO/w3l/2dJT+U
         HIBKczaOL+yGUdj5GWUqDFEdVF3ibrVSo4/bdbZBg6ca8MqX4lZgCSJWxvVOOaKi4+cA
         /lafe9Dbg8gAYHLK3Irhug4Y6jBmfTPu4vRJmdsDWNrrfVJINJ2kd2rViYiXkUxYQ1/3
         DtYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210054; x=1794814854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/QLOpX391Fwz82NJDNrzMApohUKRN/kTwsnVQ3ukXWY=;
        b=kZySWpZXnnTjEZG7AO9iddsAD6Z0A+FWdI8Lvk4i6ZaTyC+D4rg9veVMKvwEcsSS1P
         chQ45fjY/QSWFJ3Xh5CcvpLKYYONSuKiA5AgdbYZ8FYKjP/vwBFg6rjVyR6lReQRAhMe
         gwp7y55pzxhOb53kH/RwyQczQTpIKEdyrTlxeI5RRw3EbN3j031DVIIj+7xWI1euxo/i
         MwZXT3Y/jvcmu+QA2fZdcJm+dINzsaV1j4Ph2p6WGHoLqG1YCb6g9omzEayTKpcvqGAp
         4mRxO/kM5D74YsdJeqCFHPCmHNXuYRj5US9n3lVJx64wscwt91B7S01kAZMIjjZmas9/
         NyRQ==
X-Forwarded-Encrypted: i=1; AL+hErFw4MuEXy+26x55kn8NX1v6TQT/c03fTpLOMOC4EYWEjiGVoIXmZt4NJCvZgdxRjB2FmVc2xWqboUWlKFRqkPv8@lists.infradead.org
X-Gm-Message-State: APuU4Z9n/yKAeeRzF+dAdoW64jnvuUT9uwIRiML2MQAOKdVT2xB5D+Kk
	rikTlaA0qgzjY/8L4PmgpqYkBmbkZbWZBFe7AhmyM4ZC05IiMUM4VVLDSFhn7O+dc5iqbiTlmZ2
	tEfbWn7mbTQCePVMuYnkb+aFSE50wD7U=
X-Gm-Gg: AYBFou23aXRCmuuzqgda7lXhsb2KppIvRbOs8XZxEMgjLOFtyvqwr2kL7+vZcIRh4Oj
	/QjnaBG2VCC8mmadPJtAS1mvV5izFOv75VgXq4R9fg9e3plXTOWuK5DcsGVD8t8HO2KU+IXFHYH
	WJBeBym1PduDKnS1gHhJ3bkXC97BRxVTsxVTav7Zin3efAUZQW2guBtrz3sPjfbWc0kfZxI+6R6
	1vW11YM5p74MAnfag50nNJJMEawybEdcFJRd4mjFweW6zPPsBgccCmZeI/BNndrRzBtlKGu3xrC
	JWUNTJe8Tj5kyTdTUn8x3zT+MqkYtBqCung4gAfcDh7cMwmXl3EYK5d8HIKahiKcBHdflH9EOou
	+P8LCzMEsXBW1ZuViA+14F2c8q+aLmu/Z5Ag1
X-Received: by 2002:a17:90b:2692:b0:3ab:2737:3393 with SMTP id
 98e67ed59e1d1-3b12d4e59famr3159700a91.40.1794210054212; Sun, 08 Nov 2026
 23:40:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
 <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com> <80990ab6-5072-43a2-b829-177c956080c6@kernel.org>
In-Reply-To: <80990ab6-5072-43a2-b829-177c956080c6@kernel.org>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 15:40:22 +0800
X-Gm-Features: AclHuK_S-BK2XU0WY_pNWrUm4vSuurn5YOkC4y9TAw4Ztjpw5amiTRF4mk36wDg
Message-ID: <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: dsp: fsl,dsp: document debug reset control
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: shengjiu.wang@oss.nxp.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, shengjiu.wang@nxp.com, daniel.baluta@nxp.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	andersson@kernel.org, mathieu.poirier@linaro.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	p.zabel@pengutronix.de, linux-remoteproc@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_234056_811648_0A6966A6 
X-CRM114-Status: GOOD (  15.15  )
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
X-Spam-Status: No, score=-2.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Nov 9, 2026 at 3:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 09/11/2026 03:22, Shengjiu Wang wrote:
> > On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel=
.org> wrote:
> >>
> >> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com wr=
ote:
> >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> >>>
> >>> The HiFi4 DSP provides a separate reset control for its debug logic.
> >>> Keep this reset deasserted so that an external debug agent can access
> >>> the DSP and perform debug operations.
> >>>
> >>> Also require the reset properties for the i.MX8ULP HiFi4 DSP.
> >>
> >> That's ABI break without explanation.
> >>
> >
> > The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This serie=
s
> > adds the DSP node for the first time, so there should be no existing up=
stream
> > DT relying on this compatible without the reset properties.
>
> That does not change the fact that you break ABI, does it?
>

Yes, it changes the binding ABI. However, these reset controls are
required for the
 i.MX8ULP HiFi4 DSP to work correctly, so the existing binding is
incomplete without
 them. I will add this explanation to the commit message.

Best regards
Shengjiu Wang

