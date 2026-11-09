Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084EC606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Nov 2026 11:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UhbAZY9g;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AO0/yNdR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=; b=UhbAZY9grtksA3
	/ts80K/TX5M1kza20/8BwF+X3VTKHXruvVnM4HLHoQBCYwRXfUrrAVd/XgitBhRnQetmKPFBYYWlX
	3rgmnpctC4QhW9ARAPwQGzsX1QSSHYPl2gg+N5JTi1GrexADSiwgfHuEshMIWQHBICcWtf9EocruB
	CPJVkRMWO2N3O2P8ZLXuQzFeAM2iTdCNf/UiV9KxJvKvPc4X04m2lJaVhqMavpHRUEytqeTi4Rc3W
	/NaslbBZqLGlVM4WelFisFCTcvbNR+lv4gdGOOwLu15nXOEQuObPB/rB9BQWCd9R8TyvkPkFFvnpy
	ZEi4lYwD8xGGOZKTZwoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQN8S-00000000TpE-3cd8;
	Mon, 09 Nov 2026 11:02:00 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQN8Q-00000000To0-0m90
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Nov 2026 11:01:59 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8b66d1a08ccso636479b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 03:01:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794222117; cv=none;
        d=google.com; s=arc-20260327;
        b=KxCg/at8ilK1QNbCXQr/OlvjlKOhKUZoHiP3KgKc79xc1+7mvFXWLBOWgXL/LlVQoS
         VaZPZLA1B0oC/03jtmNsYNHBI+0KJ106YWGhHD0d1QL4W1VPcSiWhFr4gqERJ0R+3AUb
         Jv2uPfIfL+vGrC0lQLoQE9BKhRFOx3DOIEUaErEr5lmpJVPdplNOSY5m89qhbq5jI9dZ
         S8z7G1kyfC3BQsM0CcYUkPs/wpBEJPjcwOEN+eOEU5eyUzhJDOfV4eq5/rnA84Iyu0VK
         9u1EMdRRJkFYsnZ/ajOl/EEgdqfKdsUAu1qEdbiy3WVbwx4vZNgXzXfX/r6ckovEZ/jn
         JDVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        fh=twChh+cnz7fNYI4fhN1U4/miYRs5pe2SVC0Rpt9R2wk=;
        b=GKbyGoF7D+8IZWuXQOAkrWl2sSTJ/mPMhBr5l7biaNL5aK0GvMIkU8PF6H6oGaQCtN
         6K6xU9BIQUgHW1bfRH59ih0GhsaSxFsGDn9e52Hyjj/fNjIh3v261PgfLzZIvD6U4nhq
         Ky3wA+tBH79wZF7hj+JuAIuoQVrQIrU2YnjEWDEw37UYxrNRYZZEPTu470Q63hUp45hV
         udDvmx6MUkxDkFerp+dpfpuAHuU66VlHdgM+fhnJwuN0JukGS1kAKFyXk3esgkYpDwx7
         qoMM6QbWHK5my10as+YgXeqEOSkBCYJzjRbq9hmS83v70dELtQqHuj6Wmidp3iuwqo2r
         c9dA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794222117; x=1794826917; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        b=AO0/yNdRZp10BMVrSSTJt1R/UjORECXKEqX2n5lI1/1NGrq2Xke/jKyABaFF7K0OzW
         5lMcYiHBh+rLXbV8T0ndngrwEvQPJgNL/M7XB1LauIRZ9c+mp55EtCrEXEVW9JRfgDOx
         NneH+Wjjm1hA9Omvj0Jfxb6IQBHmOtBwpKIrwVJtTuPQx1em04k/csstCfwT4GEGN8fC
         qfBMpwSQp3R3WXLLigjpHdN8tADKENCtcHMhUFBJlVqUcSPdNP72gv3VPoRCgquebMkQ
         JPMLeWS22okpiGaUrZTnGT2zsUgMJjvgBNb06qhh7Vh3mbfF1+8eZrJ2bUhhE3qAtta4
         wXUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794222117; x=1794826917;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=stBN4IE9nXJUAYZh49JHF6T/bbeBEQPcLqjkFiGNp9U=;
        b=DRAqC/0ejLtdifewOwjo3sq3oGVDesg0Uu7o/j2vZzowpUsYFD0dmVZgcdcqwjFprW
         q+3/FazJRPZdpppAWZt4PKlvp++hkSrbO+WHYkk/TdBMMMn/h466YBvJbtMhaQYp2U1A
         ncG8DhurbT4i6pR84B1mAFuxXAaDMhJ/ZbTNyHPPBy8kev/Nr05XA18IFLPau2Ic9zXx
         7JMShdLBz2VIYEUjngiiwiFA/kyLwxenw6BQ+6YnVL/JIoVX9fkff+smkH6d5sdK1Dq1
         fRiDu2wkZRwuBui/uev3MCrqqfQ1zhdUqjnhlgSwjVZAWDdNiB3IZFHszavDz2vaDzpG
         BAPA==
X-Forwarded-Encrypted: i=1; AL+hErGOfXYWUCzEeshhZ1ujFfHdn8b6hh1WTei5PcmUtOWe9aZQCLl36CKM2QcIkPSSe4NT45bLKKMCE0N9aD9oUXOW@lists.infradead.org
X-Gm-Message-State: APuU4Z/xA1djBqwwQSYBxlC05Z/lEW9szceLzvgbOEaARtoEU7hFpn86
	h5XmMwzFKaNR7eXPaawrgDBWdIw8iznOQh8aDwwxxUJ915YMfUPbP7yoQYqC2xhhBSllfmhmGZV
	PICrg2q2mujqOfZ+sO72oU3ZSdxAt/e4=
X-Gm-Gg: AYBFou1CfyIaC7nZQZDot9d/2cVuEueH+PoqsM0FdV9c8KkhVfYHz7PZ+08Fv0xTw9e
	0vP+TOjqDqqPnRKM5ehWCMa9CcqVRvFodjlKcYMHYhH27Nd/vjvoAUlQ8ZsXpad+p1HUG0iG/Xu
	pq6hXPH5wS/4zCZhXMrEwLw6evJwKLvhReBE4y671XIB6tHx1qQB7MSXsM4LkzcxVlnjwJvLzIp
	MoidVu1GRLL9r1MobVCvYYPgYjKyKWda+jpM+lJTO5r2F9fRhldTOfjhpGbs1XYlxbQW4I+FOfC
	D1pHivyTp9F8SSVNusBiipzM/zQFNuiVvhDd24Jf0o95TkE+SETK1RQQ94LDkie0d+GlwWzAEGP
	6KjNhBN7jphFCNDtjt0Bm3ALu4jHkaD7Pu8g9sQ==
X-Received: by 2002:a05:6a00:3c8f:b0:882:d8c4:17c9 with SMTP id
 d2e1a72fcca58-8b66e343903mr3314714b3a.23.1794222116824; Mon, 09 Nov 2026
 03:01:56 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261105024106.338791-1-shengjiu.wang@oss.nxp.com>
 <20261105024106.338791-2-shengjiu.wang@oss.nxp.com> <20261106-savvy-invaluable-gaur-7af1b6@quoll>
 <CAA+D8AMxrUb-Pj74wrRn=vEyRUFKWWsR4Eq1LZ2ErsX=rRq=rA@mail.gmail.com>
 <80990ab6-5072-43a2-b829-177c956080c6@kernel.org> <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
In-Reply-To: <CAA+D8AMt-_=XqABMoeUssasrmChJem7m=Oj+sLA6qnNORTZ+dA@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 9 Nov 2026 19:01:45 +0800
X-Gm-Features: AclHuK-vLDzqpNnq7WjP_EKkxW9CPBRL2HdSB_SqKuNRWnq2UdqsNh8iwWDBhD4
Message-ID: <CAA+D8APyfdLR8cvq3GMuF9UdQ5yM6LNSwwuvt+7rYaMFPk1Y8Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20261109_030158_236412_B9156363 
X-CRM114-Status: GOOD (  19.75  )
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

On Mon, Nov 9, 2026 at 3:40=E2=80=AFPM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:
>
> On Mon, Nov 9, 2026 at 3:29=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.o=
rg> wrote:
> >
> > On 09/11/2026 03:22, Shengjiu Wang wrote:
> > > On Fri, Nov 6, 2026 at 8:57=E2=80=AFPM Krzysztof Kozlowski <krzk@kern=
el.org> wrote:
> > >>
> > >> On Thu, Nov 05, 2026 at 10:41:03AM +0800, shengjiu.wang@oss.nxp.com =
wrote:
> > >>> From: Shengjiu Wang <shengjiu.wang@nxp.com>
> > >>>
> > >>> The HiFi4 DSP provides a separate reset control for its debug logic=
.
> > >>> Keep this reset deasserted so that an external debug agent can acce=
ss
> > >>> the DSP and perform debug operations.
> > >>>
> > >>> Also require the reset properties for the i.MX8ULP HiFi4 DSP.
> > >>
> > >> That's ABI break without explanation.
> > >>
> > >
> > > The i.MX8ULP HiFi4 DSP has not been enabled upstream before. This ser=
ies
> > > adds the DSP node for the first time, so there should be no existing =
upstream
> > > DT relying on this compatible without the reset properties.
> >
> > That does not change the fact that you break ABI, does it?
> >
>
> Yes, it changes the binding ABI. However, these reset controls are
> required for the
>  i.MX8ULP HiFi4 DSP to work correctly, so the existing binding is
> incomplete without
>  them. I will add this explanation to the commit message.
>

I also think it would be better to split the i.MX8ULP reset requirement
into a separate patch. Does that make sense to you?

Best regards
Shengjiu Wang

