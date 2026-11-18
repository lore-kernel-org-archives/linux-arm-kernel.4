Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1744C606A331
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Nov 2026 21:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d3o0lWRd;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Kr2zz7Jc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=; b=d3o0lWRdj74/CQ
	jHgBU1SuA1dDeXZgU7+5tlXdfZBuptzuI7odd8LTiCxQXkdPfx5HyO0FyGGZP2n7LJQshaJ75Zzbb
	KXyjHK7fUzRX3arhA1GnOyhgLTzyL41QgHcTc5zDe9dXB+ziIaQ3ldxpBNZSG27KoTnrN43W3GW8p
	+fYKyNvANOCPbGNeN6tnzSAZjpCnc95QAaj+lxaMC0fr7Xx67sxHaBpP4EVp0G55YVanPNbso7jn1
	lzViXnF04Bku5RRTjki1h0DqyoZXQ3KQ2YXTf1EH9IAkjzmgIwHfmjlbZwKHFqdewbnRCvc2I9gNL
	DxWCgUzrisugVLl/Yocw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTn7b-0000000AIx6-06oS;
	Wed, 18 Nov 2026 21:23:15 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTn74-0000000AIrJ-48mO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Nov 2026 21:23:13 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-3ae25dcbd81so14439101fa.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Nov 2026 13:22:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795036960; cv=none;
        d=google.com; s=arc-20260327;
        b=Z8iocgFcgpFRmj87jQmKTWbQuN5dlzF+DEP23YC44NHWyl4T7hXbBzHGssW7CDrImB
         P1co+O4Js1d4CcgfTUQMN0RPrXhV2NasQF9mcqMmtKz0nFErIBrAGgVZC1nm6YsK9EKY
         ikb6XRpMV9j9ED7pI/1cqjUSvZ68Z5zEtCNKQBuapNvaV0912rl5sxsYE6L8JVfP2tSP
         D9/J3Y0zVODEJ+FMv90bpivr292I/c+gq5obBEQStjXs1u8kHoCvXNho1HCST5KY/EGW
         +vsXG3aqTtFEnkLOro/8YXS51vT4APp5gOKCsTxMBG6H3Gjg2cpFeWa2bhrOsAYbUtBK
         kpng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        fh=0874XH4A1M48MAl1U+ClPSS4zY/Mwz4p34rRDWBf1Zo=;
        b=ET+JCNioHhfZRzNTfSpx0zVk8zsLtD8HoqHFbExbUFM6Q2HdjIEHP/nLPYmcQVT9zy
         Tc85b+xOEy3bQDsx6pc+cqXefTGtj7Dg6iv14scFLVC42Miqcb8i/tQR1AQufL9zuY3J
         IrqmOLpWIK5+AOPeYrImFVBTyzNVNpLr859h5e58IJ8V3Erj/fbmvVI70kzoNOEkaD3W
         2YAYmkjjYsCEDVer8RQiLb/iSgGkrZUaa18WcUx2lVNT7ZT57zyo4DH7TQlMQzM9s+Jv
         VDA0DFp+bQc+8QZKajPqJFcm5rmaCpco1wVJEbnkZ3hqj2AyZ7yCVwaJs6dMCriPg2cL
         s+LQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795036960; x=1795641760; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        b=Kr2zz7JcHOvJY0EEQD04lLob9dQ+z7CfAMX5uzl1AbUcv9EI+feRNhBTAk9rVRyfcF
         v4OINkxOXP2mGqtD+9ckR0rYbpcjmagR/JPoDCh4gz7j/oz0TuB59AyuElhlXn0ilyOb
         2vIB+chbR1w743UowdQV92NQk+cuxN6coDpb1owtjNB+KK8RNaN28/+DbqGec280rc8a
         qBbStdvpshky9PIyExASCcGwpd3zNISr5O/a64WFBlLqt91ThTM7U/jwHTYQO4chrqmB
         OZE3w+t6Lq9jfr4WAOhdivbjzrlII+/jgATjtTDYcjLsEKPi7L55V7xd2EO8HCRpMXBj
         +AQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795036960; x=1795641760;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=77XdCFnBpPZUcglChSxtYPfey28T7un7NOTqJBqY+Ew=;
        b=PUfTarn3HdNwfiggdXZrqQ+E1cOncg0CBtKeZ5G0W5qCm94ynf+mdJJlBr3AadXsA9
         veAC/X8OUtmlFRu7yc+ZM2Jh7YgNpIKpV2UdMvgChJ0huLHFV89dg83QYukaUYbIFoyW
         VTOD3XF2y+t2OXW5kI9O91FPS7sF8tE0DGaKPdfa8VYspSViubZtC9bn4qMXL9CcHxk9
         R8oe8MZON/FCeQtfQYaX8Ep1yScTKGXk7PxLIOT5G9SqcoNrhT1mgPfPSw01CThCFmPw
         mxcXCoxsYZRJMZRX02bhJjPbyhuHBurKGb2d8r8PN4YXpett3hB3+VT2X7WsjMJyii/j
         IJ4g==
X-Forwarded-Encrypted: i=1; AL+hErGLl5V/ttd23hOtupwv9eqQkkir+gzQ6XXUD322D0Bt/LPzyKBCcfKWdPaiJxNLOXaXsSUl+fK27b+xis2vHyKS@lists.infradead.org
X-Gm-Message-State: APuU4Z++cLdGf87DYvzFfmoene2Dn/1H7F50rVGijHykTNABLq5P26Nj
	yfUHjx8YWKKBmcd0d1qk19zfaRTBPKJceGyoKrWgOBO0SPZbG9f0hOUpdf1p4gNcWRknP85O4PK
	LPFFg27C9MJnxG0YaKVPLYFyBL91HkzM=
X-Gm-Gg: AYBFou29yxkP6so94H6h3bdCHJQDePvaGMID6FpBoNpkNOc4SS408rZSYKgqLLyfEOT
	FPYHjrerVBqUsp+emoVFtXBhr7/jsNFa2o9sdnbq0OU3ccT23nnwSMpYgV9lHAsG8vYlZgTRkT/
	yjroLP26Xiv5MN8ConFW4Ig25Vvy/jR3gtjOeJu/bJV+zy69Squwu7uZ2Vb+sJ3mftZXzdC3nCn
	0zAVglSRMkCb7eYZxOqSDoH5pATN5SToa7aHWtd7vTbQS13f/K5QUhEjhge7WoqC7lqan8pVZPC
	1J+HMxrMLHjSpY/9D55Ds6748aBm3HILcRJsuno4HJK3uORnN0IaeReC9k950fSWcHholzudbyS
	CxmzTmlJz/CGenLwSa4Jc4J7rkHDSyEI49wTZgO4N+knBlTd0XEnOxSifOBy0OAFNO/rWeQDVTD
	ETwiyOj08aArTF9r2RfM7eWW8+
X-Received: by 2002:a05:651c:e18:b0:3ac:e304:65 with SMTP id
 38308e7fff4ca-3ae67323879mr13145831fa.29.1795036959773; Wed, 18 Nov 2026
 13:22:39 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261116111802.2442456-1-lukma@nabladev.com> <20261116111802.2442456-3-lukma@nabladev.com>
In-Reply-To: <20261116111802.2442456-3-lukma@nabladev.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 18 Nov 2026 18:22:28 -0300
X-Gm-Features: AclHuK-Y6IDFt9qpjrJDNGTsfQL4BjSsgswFvwywajIkisS3KGgYyNt_017jMzc
Message-ID: <CAOMZO5AiGRHNijfDcCXhsrQDwcWDwHNsxVEoHuEaGdVaR6JBWw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: freescale: Add device tree definition
 for Cloos CBASE with i.MX8MM
To: Lukasz Majewski <lukma@nabladev.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
	Daniel Baluta <daniel.baluta@nxp.com>, 
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_132243_052689_C3926175 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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

Hi Lukasz,

On Mon, Nov 16, 2026 at 8:18=E2=80=AFAM Lukasz Majewski <lukma@nabladev.com=
> wrote:
>
> This commit adds support for CBASE board, which incorporates the TQMa8MQM=
L
> module.

You missed addressing Frank's earlier suggestion.

Please use the imperative mood: "Add support for CBASE..."

