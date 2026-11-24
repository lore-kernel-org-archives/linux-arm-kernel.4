Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB581606A693
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 20:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3mv9L1pL;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=YEWzoWfa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=; b=3mv9L1pLhhkYiT
	aO3dyZlu2o3fzs0rL2EkbuCC8woF/ZZHY5Q+hRyrrrOw1aRLi79uWNbZR3IVZQqUcS6XNEe5adG1w
	mleFc1omsotP1dkukPDSnknzVsgaduJifPpNDpIRIDUiN8UyNc9Wtc+Kif2v6KaMd07iDGxSvsMjO
	mJgP8RxBYsXXrFmycvF/MkmVNOARD7MYZuts4/DrHSl8NoveKUYy/APOUT7J+orOjE//BwigPCS0q
	WsbzhQvpP9MdQDDkTUlrs1IXCtAtFO9ViZUIOoaeNSQfG9ip6uenQ4lpybB5UQ+eIsZ11+fGHGYF5
	nmf0kkE18sPeMczYQ2cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQ2-00000007lNM-45Ye;
	Tue, 24 Nov 2026 20:47:14 +0000
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVxQ0-00000007lMB-1NFi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 20:47:14 +0000
Received: by mail-yw1-x1133.google.com with SMTP id 00721157ae682-8b3402105b9so35588097b3.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 12:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795553231; cv=none;
        d=google.com; s=arc-20260327;
        b=iKo24yOs6K1jr8Qpp0J1jpQpKkYkuXrmpD7aYmZkgxpPC7wiaOWbFOCzbCrfYN0U5+
         pPfmObQqT6IUDBXbwRIUoFPPW5AvfpZQxQISamhifSefACTCn/DK71m/grK/kQX005Ah
         fH+yHAYE4ZvF3XQrWoHYmyhBP86wR/ddXmaTPYuWErxAYu5gjA+Jzxx7bs0IETneIKUm
         i29rvZjSBLcUSTZ+usG2QMQXpELrNDQLW9zvQ7OgzAldqnfvevTGJeAD+WQ7uYoRB7Eo
         P2FKWKjeJV7yaSxEUmj40M+MJ/qcx4a75SrzFzju5AdJPjFeqhAWCFySp11ZUk7gcTTo
         6ymw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        fh=+43IUYsQEA42Lhz48LVGHkWz+tRDYFDiOIaSuiQH2wE=;
        b=h+eEJ7ZISLGBRk+LKZ0KIW7Nnah8x05TeS+JSfbPgRv2gaY0RBafcG3XIXnHbM3Pec
         Mp8+q1QJodgAiLzxxNQrmGDXxTFtXui80j8U3+YlrfM9S05pMHbJQ6jkQcQZFAH+m5GB
         s/0O5OX+wRkLRggCgSjK+32Vc5SSsMG5XgG8ZqL2yZjoQ+WdbjtXF5ktVZQiV8WfRJ+9
         CkA2KhMtitUshcdLZsUGw+sjLKWqpvo9E2yQnzBln4CafPC2yte/q3tI8sU+iU3NjDxr
         D/PEJrrhQ6jjt6Vn9MoLfaIB77XwydU5hTopGRp3W3GqFYoReCMX0NGlhnZ6QT2g5O4X
         PYfQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20260707; t=1795553231; x=1796158031; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        b=YEWzoWfa5m8lkp4l71xUanG9dbC5YpDv42AqDfqC1vJu03ZTI4P76HYMaLznxF3dWc
         7AGggwdwMjgVP06LnT6UqgXykt8MzlqFDw1REqueHOmeV4UeFPDLCeZSbIquDe8P1of+
         f7n0ZFdTZz7r2iS9jeM4Ln+gMbvVvOcD/XX4zh0vKOQlghFtv6c2nJ+GmXuhqkssc1O5
         NyeMkeE0Cpox/1sqtEpYe7OoE6jQrk+oMC2BeP8bdYrqr97OxlHb2DTrXXl2BrNPQzQZ
         gKeJhiPZS8JVT/L1jAbfpVIDBCy2wHl3wpwuVg2mcYi6phXJO86MSj3r78RN1j/3L92D
         lMrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795553231; x=1796158031;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/lbzr5VuUouDiq69BqZ6eFV3fJrAmKd5QRsGlHOj7D4=;
        b=M9GluILtTdSLoIIzVipTJ/3qEqlr1i6rL8ja8KDWBGDUGduzPtwqUnYnpM0i1bh4B9
         qxDAzSWmRa58dBj/pDtIxpOZxWzN/fX5cdRdM+mDeuV69DG22PmHosFZqKIh2eDLRXJg
         +TnQ64SSqlETemepe2faqSR86aNRj9fOvkyZddv3D0kmmtqZ9bDEpog5d1t3gfxhva3a
         sTTHIigF4lxafKQ8cKYYYMb8vE/K2lGufT68YnT9A68F5xw4oxblvtsAH5/CHXkQzs3q
         2yPRu7sV1LQs+vhQXLNqQXJeLVil/8cUkCFDOAYDWOQAGWW9scWPU1azbf3hEbj8WdBY
         0KCA==
X-Forwarded-Encrypted: i=1; AL+hErH1EpEMYIWsH14qIzvmNfBSuWg4IEZ4z/WmZ6pbi3dtG2L1ni+5z1FJx0BdZ1ShnUe8SPouk6rf5agjb8tG2MD9@lists.infradead.org
X-Gm-Message-State: APuU4Z/CB2ZoB1K8b1D0+fvEuMMKtEeKLULb3WyaZUxxENf++8q0eRsY
	Q+gE4w+cUZxoMqoS50vaxyub4/M3ktPyfsREnGrYZAt4WRUVsF/cfMYHWv/GwT5i7gkTTDotJDZ
	DDNju977QOw3D8b8OJABG5l+/yFnX0Q4=
X-Gm-Gg: AZFdTZcNLnwwFJzExZ/S2bnqm20351/MtlfLV024CCPz8DBmX7gURHKvo1w3xZq3ay1
	IABdhQ80iKXuKqaOMqNmYzkuy0+Lfgx0MQVBtnZ5dmWycZ2Yg3tDS0AmBAs076YyIbv6Vd0OQeE
	yx879AFOi9h15I5m6zxHGyruPdgmEDUFRvThi9wHQl/dIP18hTegM8kCtL7Ol+J6ReNp8F8Ug8G
	Ixqs8EvEUcLovlRdOAxV7i5/QHD8scs6t8IRHO6LIfl4sKBzKBuylJ0onbnLYU5W9lH36e2T2oH
	KW7N+pEQDrP/ptxXLiGk28tjoR76GOSwchYhedW/5fGYKDruNd3wijXpxjqSKZqewx+BgRs6zyR
	6i09v/1OeT5uDzeqKd31tSNZg0lOmk/8wbvpoFm+5TCMvLrU2P4W48zbtsJ1sv3mbYAmJFA==
X-Received: by 2002:a05:690c:6c8d:b0:8b3:2d65:2c72 with SMTP id
 00721157ae682-8b52047a894mr61098007b3.42.1795553231171; Tue, 24 Nov 2026
 12:47:11 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261121213102.143130-1-tanure@linux.com> <20261121213102.143130-5-tanure@linux.com>
In-Reply-To: <20261121213102.143130-5-tanure@linux.com>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Tue, 24 Nov 2026 21:47:00 +0100
X-Gm-Features: Aa3M54piMjiC5eZa2JiYOkn7APdjKphVw0p4pBUTRqSLCMVNRfh1PWCBswFg3JY
Message-ID: <CAFBinCDVe5njTaO9xN-snXRQGKHDpsber4hi9P+Fq5SD2jMUEw@mail.gmail.com>
Subject: Re: [PATCH v8 4/4] arm64: dts: amlogic: t7: khadas-vim4: enable the
 ethernet port
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Maxime Chevallier <maxime.chevallier@bootlin.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_124712_862349_2323132A 
X-CRM114-Status: GOOD (  13.95  )
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
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sat, Nov 21, 2026 at 10:31=E2=80=AFPM Lucas Tanure <tanure@linux.com> wr=
ote:
>
> The board carries a Realtek RTL8211F gigabit PHY on the external
> management bus, connected to the MAC over RGMII. Its address pins
> strap it to 1; it also answers on 0, the RTL8211F broadcast address,
> so the vendor tree lists 0.
>
> Enable the controller and the management bus multiplexer, hand the
> controller the ethernet pins and point it at the PHY. RGMII needs a
> delay on each of its two clocks. The board traces add none, so the PHY
> adds both, which is what rgmii-id asks of it.
>
> The PHY interrupt is on GPIOH_6, so link changes are reported, not
> polled. The reset is an RC network on the board, not a SoC pin: no
> reset line.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

