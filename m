Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E5606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Nov 2026 05:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X4YUpEff;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aQiiYfIX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=; b=X4YUpEffhsvlPZ
	+BXLkGvTF2sMhbyNcrRGrQtlYKywkm0ctFbZe2AMaNVoAahAQtBW+r5OhLjUbpWs1ufkFVt1eS8uz
	FbYkWtRy88hYcaLsPtXaQJncoeOnzoaMGTxLhlP0oLBzXc6j6VhNGR8Qyr0G64JHWOuA0ONXgzQsX
	iWlRs1bkmO6B3YGX+J3BvhZ9mBTtr0asSWa4E4yA3SJolglkJMDDdRxrRMWRZqH7ZE48c++YCkRh4
	wQ5aZvJDUPJTGq0dfKqQpfJ/pn16VbVgRA9iH5wjUmUaCWMTZk3cRNcDKxG4Gijq4CXKttyN2Fd/C
	EF1AisL1XeqjGw553xCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWorW-0000000EzIh-0G4T;
	Fri, 27 Nov 2026 05:51:10 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWorT-0000000EzIM-1rNf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Nov 2026 05:51:08 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-c505b2e1cb9so1388853466b.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 21:51:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795758665; cv=none;
        d=google.com; s=arc-20260327;
        b=F7Rjl4+XbVZkq0Eu/5esaOfRr876B1vKrguUyT1D4kHIx7wC2UqxyoBxf/8sm7U5ms
         NG00BxeeakpgRSI6P7ko1AcNLK71xevQrVP3pA0KkBH3cXyomyzwSrjrOEjfikWXiPc/
         jq22CwpUyvD7bWT7llMtjBjdY8I+n4Mdvspcb4VH7fbe9r4FJVxCRAsq7jPVdxmKP0hM
         M3+gguGJmtL5Ny0IX7y8yRO24lRoARrmJ7WpPOxRinKlRDQsCMlPdar3MYuiU5zzUtXq
         pOfkhSMcPJBD3cq7ObVBZY8PhP4BU+6Nywxg4AvODmFk/5JJleKM509YTmpMgiO9j/vA
         7csg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
        fh=+77B4DAxVaY8MAaYtE80rn6GNRykVWE1L29P7acv9GA=;
        b=hp29/eC86mDAIdM29Bnaqpt++JBK71w0LBk15j/EaEYnayOpRkGlbBSYv3malzKLGy
         VNLbIm3Ts8ZhgMCde9ONZVd9PKojp56KhmhXgceMTbePTM8XTUF1VT4KfRlSiVpUXsGd
         /24LXFI5XarNM+3g/O8luOPpOUvA7XxIhND2g2HUeJH2OsWp6Xf5w4NBim9OJPfBMLdI
         9uYQ5avZubnWt3iqr9Yub5mk8Zp8ZN+KPtD7lfNbndbSb0kClh8BxScfaDj+QkCHLFMn
         8SXBovuNJWnk9zdtQgm8NfDCUDzQXyhkKBlkdPFU+JzZKAMEVCjQjiUtlOjC4e09+5Ry
         5RJA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795758665; x=1796363465; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
        b=aQiiYfIXyW0vgrtrbhI1KN+OqwdcjQYfN6XQN4irBzbeSLjEZ9ENB6tMO8CSzfY664
         jp/K5FChnqngbjQFsmHou5yTmRUwZXK10ME1BbFEmQ35MLYDnuVbUXiwHJOBCbxkyz4F
         VylWKQ2mzv5+lMu/hjvLn5IJdLQyqxVLsDL4qRqTWdXwyhsKM1du54FvJxKVLipUBYAr
         3rkPnYRPDUaa3Iw8exqc3WXODpO9KkUKdE2nCO+nRV8JLchHBqS/G5VqJvFsIxbKf1zd
         GRG5Kt5bJIhgyYPZ0IpZ5vITI5LRE7UKYMr6DmLoMdDl/zon4D4Tgvbl9OeobLzQOhpE
         RMhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795758665; x=1796363465;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkYBrOVOkkEfmCGGQQnGpXrXRuB9vT/FlGYKiBKIwm4=;
        b=u6xK1GfU8gudkZbPRXnu6V7o4P+aHkkWtDzyTbPEBHOWOW4V/h/opsoOwtsZ+Dcf/Z
         CFPyk1h6ltDdPcKAjdNtfJxpxYXuUscdoX8gdt3A8QiQQEXTpdsoDUp8eXXix4NLounp
         RfXLyeU+YhetnDx4AhMKDPN2b1WcpR55rJIzMumaEmKstjyCXgV625fr13lL8eYjF+ku
         AK+keCzMWPSHjjCV9fiQk540vgatF/kB+YEPTlPWPfjPH3ogFmQAOMGOz6uwGJm95aMW
         PbNW4o+G5kcEnG5/Zxxiq+xsS9izp/MSgaGgEkBAglWoFT7a4YKx4wjZ8JGgXI46PSPC
         FpYQ==
X-Forwarded-Encrypted: i=1; AL+hErEd17A8cwx4iIuY2gNqsDFCy5ywEIEVs5LBCGd2EMqxsqa69rGt9VCtz0LFDfxYJ3BMOh7Fp0cN34a5umM4AS+d@lists.infradead.org
X-Gm-Message-State: APuU4Z+it/wmAyxeGIwef6B9nGgnK6OByGU5pEHepXxn4fiL1jt/wVeH
	NENfIONNiHOsfvmZRtGPxeBjwWH2XmQsTrUixTuVAJ+mniYE7W3/exqvhKiqPcZNqTQnLoU4PNT
	jMFAHIq5Bisz1kK199CF0d1kM+qyiZJ0GGAava+uULw==
X-Gm-Gg: AZFdTZewrXlm+SRTl4aj6kltpft7n0Q4QEk/BxtB/ICnv7Jip+qrqkStG/1sSK8nL+l
	N2Tr1VC7wmEsiH7ni+h04n4kB1udad/b5KiEBU6RrEZR/SxGQPMG6cupFZJzAVhIvtWs0ExvVCF
	nkIPW/YzQzPoobPiOpCSggslEAaFHyKoQDg2cSI9t2+WO56kiHtvWwn1yUi18qZMASUZHXpcUoX
	QL7XBJ/RNQ5sqC0+72/BpeI2iokF7iBLi2z5BtAd7d3Pdk4YZ0xHIkk5O79p3rqCddqjXkZz5ZJ
	kvdIaB4zbgN40TEVBC2FRzcwGxGyM7+ZciXrJEN+plYUiCa2MbJbbQCnZSS23XYWl5RRYs6ioCG
	rK3lleQj7BHXayDq1tjXNh0soHrWU4/aEKio=
X-Received: by 2002:a17:906:1553:b0:c50:576f:b39e with SMTP id
 a640c23a62f3a-c513ab0cf13mr1274661966b.26.1795758664865; Thu, 26 Nov 2026
 21:51:04 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261126160102.52163-1-dinesh.v@adlinktech.com>
 <20261126160102.52163-3-dinesh.v@adlinktech.com> <e281de75-7294-4f7c-a570-d51cceb70c24@kernel.org>
In-Reply-To: <e281de75-7294-4f7c-a570-d51cceb70c24@kernel.org>
From: Dinesh Kumar <dineshkumarv85@gmail.com>
Date: Fri, 27 Nov 2026 11:20:53 +0530
X-Gm-Features: Aa3M54qZ7qETuPSsSaydI_K7kgRHcYJbzNWIkAB1COl4VYnvMvXjxJvC7-etm4w
Message-ID: <CAG4v1_AT6kMjExcy+L7edXwnFVrJjjjEBC19FDaJyytAXU775Q@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] dt-bindings: arm: fsl: Add ADLINK LEC-iMX95
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Frank.Li@nxp.com, robh@kernel.org, conor.dooley@microchip.com, 
	s.hauer@pengutronix.de, daniel.baluta@nxp.com, imx@lists.linux.dev, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kernel@pengutronix.de, festevam@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_215107_522946_9B79BD5A 
X-CRM114-Status: GOOD (  12.25  )
X-Spam-Score: -1.9 (-)
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

Hi Krzysztof

On Fri, Nov 27, 2026 at 7:10=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 26/11/2026 17:01, dineshkumarv85@gmail.com wrote:
> > From: Dinesh kumar v <dineshkumarv85@gmail.com>
> >
> > Document the ADLINK LEC-iMX95 board compatibles.
>
> Looks confusing with the actual board. SMARC is often the actual module
> and here you claim board is LEC-IMX95, then what is ipi-smarc?
>
> Explain here hardware briefly.
>
>
> Best regards,
> Krzysztof

Thanks for reviewing, and sorry for the confusion. To clarify the hardware:

 - ADLINK LEC-iMX95 is a SMARC 2.1 computer-on-module based on the NXP
i.MX95 application processor.

 - I-Pi SMARC Plus is the ADLINK carrier board that hosts the LEC-iMX95 mod=
ule.

 - adlink,lec-imx95 identifies the module, while
adlink,lec-imx95-ipi-smarc identifies the LEC-iMX95 module mounted on
the I-Pi SMARC Plus carrier board.

The Device Tree files are split accordingly:

 - imx95-lec.dtsi describes the module hardware.

 - imx95-lec-ipi-smarc.dts describes the I-Pi SMARC Plus carrier board
and includes the module description.

I will clarify this distinction in the commit message and Device Tree
binding description in the next revision.

Best regards,
Dinesh

