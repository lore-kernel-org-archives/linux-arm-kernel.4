Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BF7606A698
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 18:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JMg1odMo;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Iz93ajdg
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=UQyjdIZXnyN7pbRcpgqMvYP2FTIzZjKLrH9OPluFP54=; b=JMg1odMo+NUUEY
	w6kG3b8fCVmOZfYndGmISyjw8XJel83KG3CslR4Os0vfbCeARA08eNK6OCX3/89hHhejjlQHkUvbX
	vqhAx+kLlkqOAM+jEnWDGgp92GHGDHUpPQMcCY1CyPtQwycb7GaOlbxe7KW1Sq9u5ru8NL2aRDDOm
	PeLaluXNSM5pYPyjcynI++HWNPJnM21ZtluIi5dZmwPc5KhbImfc3AXMgc/joJfCSqmmKtUZ1kr0X
	6PBbjoQTh2vRGJXtyqlrFGC9gkmRRbF/Xpwqqc6yDIxWB/Lb+Wb8ta0LapNqdhaE8GuwZKy/QbYK9
	kAL8HXaVjtrhzCX+Ecww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHVO-0000000AyB7-1kgP;
	Wed, 25 Nov 2026 18:14:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWHVF-0000000Ay9X-2g0D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 18:14:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1A9A962E33
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:13:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59C8D1F0089F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 18:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795630436;
	bh=UQyjdIZXnyN7pbRcpgqMvYP2FTIzZjKLrH9OPluFP54=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Iz93ajdg1Nd8CJzVL1szboFhLn8kqrwe/ZCcJh0uQLv97qGaDfCqudOjhaTObJBfO
	 BXliTF/2V/TQYgVUCimigeZEPsiVStwzRW9nTEorwDTwgV+1TdSU3Sj3OJotAvi4f3
	 pboPW9r1qTUv2Kmgl/FZmcBd+gHS2PVVDPbSGlTWWJHmygCPpZDJlJj7NFMQnsgMJF
	 uTzw/hoQUm28x9z/+JEJKdADDjK/nyr/I20r5dNvMXoagOwwilIjGY207fwZ1PpqQN
	 43F5dyWPzJx37IRk/janFiAMuKhnZYrpEgdmaGC5zeyma92Y8ooRZcnw47XBw3qZGa
	 4/qGZJmZB82tA==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c14f3dab66so5832420e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Nov 2026 10:13:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGInl4s3Xsx1ily9qWVYwsw5ESIR1ygKOgdvINnjxvz6OZ5gLqd/1Wp9MDVy0NG9n5VRy7Ps3HKmffb84+YcDvS@lists.infradead.org
X-Gm-Message-State: APuU4Z8PIK1dXlhqST+T5dEmwHPT7irpc2gwTaqflHZmUuOhV0aGNQQ0
	5C7dWwm50Exqr99NYLKTFPhJX4bRCi6fVHYu8tVFNLTEU+3xykZwdvkX81oRJL5zQvt1KDH1q6n
	e8gjNgW75ir7GstjIXmQWqlyqXk7ws94=
X-Received: by 2002:a05:6512:2313:b0:5c1:5457:a147 with SMTP id
 2adb3069b0e04-5c1b7c5f28fmr4759565e87.32.1795630435118; Wed, 25 Nov 2026
 10:13:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
In-Reply-To: <20261111-kuno-dts-memory-unit-addr-v1-1-89e965f2c3ac@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:13:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLmnHp-TVDj4-CKqH-020GkmRZmgVx5-u=Uem8c0_NhTBQ@mail.gmail.com>
X-Gm-Features: Aa3M54qKCffdcCQPk9s4DaSpiTPHhKFZVElFuVJfZUz3prnPo1qEkIVkhJwQfoU
Message-ID: <CAD++jLmnHp-TVDj4-CKqH-020GkmRZmgVx5-u=Uem8c0_NhTBQ@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: qcom: kuno: Add unit address to memory node
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel test robot <lkp@intel.com>
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

On Wed, Nov 11, 2026 at 5:16=E2=80=AFPM Hardeep Sharma
<hardeep.sharma@oss.qualcomm.com> wrote:

> The /memory node has no unit address. The dtschema root node schema
> does not allow a bare "memory" node, and dtc warns about the missing
> unit name with W=3D1:
>
>   qcom-kuno.dtsi:89.9-93.4: Warning (unit_address_vs_reg): /memory:
>     node has a reg or ranges property, but no unit name
>   qcom-kuno-idp.dtb: / (qcom,kuno-idp): False schema does not allow
>     {'device_type': ['memory'], 'reg': [[0, 0]]}
>
> The bootloader fills in both the base and the size of the memory node,
> so keep the reg =3D <0x0 0x0> placeholder and name the node memory@0 to
> match it, as done on other 32-bit Qualcomm SoCs such as apq8064,
> msm8226 and msm8974.
>
> Fixes: 7f6a63bc5fc9 ("ARM: dts: qcom: Add initial device tree for Kuno So=
C")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/r/202611101833.G7LTXoJv-lkp@intel.com/
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

