Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD1A606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Nov 2026 12:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=l7mvFG8E;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Av9AwU/T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=; b=l7mvFG8ELeD9f2
	Rqv3ODdXqgpN4IdS8vFSsX/1MkLAt2/LDYeZMwV5MANquTNGgtrloYqixBKSkIUB8HzgJSx9cwS0A
	S0HJwqhDwidldU/5x5udNIzwxGIULwH5/fWs2KDLf0wOkSMr3ACWu4YlImTDjShbyzLH0GjaW8Q4B
	QAQQy8eWqzTbM1mPQLnf5r0qUm3vETxBxCtqsoGQ//LHooNqapAuvrwRtPZbuLCLlLa2QJUJSCcwb
	QdI3lv7mPTspXvcU9XeRYA3BwiwkNGk6zOj/YGuZrsKAm22CZMcCswaEHBnSoms6f/MT5BwihS1/p
	t6J04iXjCrBOpIJXj2VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNUx-0000000EvBm-0yli;
	Fri, 20 Nov 2026 12:13:47 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUNUT-0000000Ev6A-0Jq1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Nov 2026 12:13:18 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5c07c7306e1so649741e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Nov 2026 04:13:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795176794; cv=none;
        d=google.com; s=arc-20260327;
        b=nYC6cLjudVBQYPz6p9AUEho8ga0l3Mx7BXtLk1H53FRpf9W2O7VzQdL7W3JL/6f3Oa
         /5oDKF26/Bc7LbQj3iU+zF7CK0C3D+4t3bfqLA5QesFOfKQpXHXsBUN6cWP1JSda23GT
         ktsOT24GljeMaF6VDAFNle8r6IItprWFGJP+S3xtkIXLsWOCvzn+xCnYCq7QNUnVtocA
         H1+o6qjmfGte054a/LZLTm3s+At2p+TEMAXXB+UFUz1qiiMrQC4XS0in1ivarOKVuGH+
         1OeuDL+WSNnYiBzpqXQMUBakDFKAfL6kqB9pRaFkT2LOLySsevaVsCPUQ1v76dI4+cT+
         a5gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        fh=/2iJU4UCnT6zrZqf0CPAnEQZ+oUzka7efVRSIq2OJh0=;
        b=Rve682N++JyNsNDX4w/PMvfClY0/5qLXoxkYojRQ3c3GjnR6yisWMk+6MA3NJbTuz1
         PwDcDEuaunML4opqxY+xl6exYsdtlqNuTiMDxG8gC43bA6zhi5YrIWk8TI+6q2gjXqYM
         CEmIe4gvNMGsuB7GPdgLVz7pRzrG95Vpxb1D2X2KFgNA8ldRgNaUY/zMTtTJfw4Hs9tp
         tvV1DpH8fHMpcvyQUS3N3LT5VFysVgD3VR1vjkVwC7VC0sSOQl7vHSB7VlDdehy8YBK1
         a3CGvT8iGtH77lg+wApm9MT5IWepFc26vrZ4vxU7RYH+wlqDBihrQWC0GUnW70MhWIqD
         Zbdw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795176794; x=1795781594; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        b=Av9AwU/TAJk8DklXYgM82sd6n8XGMoTH0eeObxxgdb4E/mNid+shT5xdCZk11oIqPX
         uCyQ6mDyDrFbsuJtRb9VrLGqc3Ofppdvap/qznp+MC2dd5DMrXXydKlbBYJ9M9GCJVQq
         FQIqLo+YVW9ZC2NkZDr8zFKlGn8YlyW1GaD2tAgVf+sh+hh3MhL6uOgrG893bmu8sRGQ
         IYVW1C+ejK7kUnQK2TLdElA1Dr0LHKnRd4FbJDS/1ii5Fz6NRxIKIemt1RIRZkpo1Twu
         KDI04dvWS/xJiCld7QAvsYidrECnvnLCfP5KRUuFKe6UBqWbPcdhVF5jq8oWnvDJXE3M
         s9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795176794; x=1795781594;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcQffss7eE/XcLf/4aHYjQKeo+L9JMp703XSJQyfycM=;
        b=AtyGmD0wlG5jocmoGNGcW30D497xXBKIreW9G+Hs8tCjfZxNBUt5W9WGt0MSjSgjoA
         YYP03i1S6RRxcsUeP7oeejx4WNNvMgRcUfCxtNwPGTDiySNJOfm8lj7L24bRAUOmQVzp
         uWOHgBhuQ3wiAVbwedgwzZsVGbO7sZ9sOKICVqKk5rtc0Bg9Cij1n5gRtOuKT7U0lQCK
         Nf2FPaV5BXXjwbjfXzt6FiSl4Ym6YsbQMeR7ZHWshLaCfYLUtSHR0fvEzoaKtfCSIPAM
         JhPngnMJcfA6FFp+EX7fGuXm7ZHb1FMVfArccn1JJq3NVbYyBl1rTyJQsgMqTatBU33M
         yb+Q==
X-Forwarded-Encrypted: i=1; AL+hErFuK/Nd/RdScy404iDTxv8uu8tC+z2uU597jeIzWM3lXw49eiT47fY5RRwSBlgpTtp6y9uJjTCKlwuHSVfiKtaj@lists.infradead.org
X-Gm-Message-State: APuU4Z+YErictWU6y4INB1n1u/RdlVBac6xp0cXE74a8A7e0XDa3Sqyz
	rf/EBvEuUMZ/8ub4xbZrOiiuhU3wyLQa3DzIP7wGZShVQjkKbC8GNnf6PTr6RINjVHXbLdUBQql
	fBiN6JFS26uaLZZmvzww7iPdcvMs22TM=
X-Gm-Gg: AZFdTZcx3tL9q6l/f+lUQIxXf2m5lSqReWpLOjpsSYAplhfmQzUTvUVb85prUfgEiHT
	8fG4poEnfs0C7m5lRFNXSgGyZ4UJl1i67ISTSGwyL1wreoxIzGGghcjL/FWINt9RtY3D5gqYCMb
	bK1v0f2zS2b+zn1cO3Wa0YyK1yppsqI1jWiLkU3Pnj8wXd8Auj3cdd8si/7zT4Edus71OrLDiQJ
	0GbJUo8Vu2/1AiYNlVu4gcxtMOaGu/8TsUeRYqd1wK9Pfj6uzaIlFFoTSCMGP2emC+Uw4sqeY9D
	ojBiSOeS/PfyR2dd0BoK1x2WmVcdn/urZMmID3zw6zem22poHpzBN/4AjVCh7NwT5w3LFB+Ol75
	KHkGqQY4dtm3PEoTCOMYeowk1ofPRL8D3oMizZYxpr0u7g7NAw0YfF0DrJw1V6QJy3nbEAeEWMx
	nMDub3I5Ii81+8Dxfr61xkqhXi
X-Received: by 2002:a05:6512:a78d:10b0:5c1:46c8:4797 with SMTP id
 2adb3069b0e04-5c1bc7d1153mr604351e87.17.1795176793721; Fri, 20 Nov 2026
 04:13:13 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261120-b4-imx937-frdm-scmi-pinctrl-v2-1-911487a14300@oss.nxp.com>
In-Reply-To: <20261120-b4-imx937-frdm-scmi-pinctrl-v2-1-911487a14300@oss.nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 20 Nov 2026 09:13:02 -0300
X-Gm-Features: AclHuK94xOx7RNiFqLMbC6LRL1dQuiXB8r985LNFD94WYgXQMJhVIsyDHnh7OLI
Message-ID: <CAOMZO5D4KV_v7w5tcLn44UsMxpOFDQwr48b24Mx1Fy+v_J-WFQ@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: imx: Use of_device_id match table for per-SoC data
To: joy.zou@oss.nxp.com
Cc: Peng Fan <peng.fan@nxp.com>, Dong Aisheng <aisheng.dong@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, Linus Walleij <linusw@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Joy Zou <joy.zou@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_041317_602698_EE90A26C 
X-CRM114-Status: GOOD (  10.37  )
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

On Fri, Nov 20, 2026 at 7:46=E2=80=AFAM <joy.zou@oss.nxp.com> wrote:
>
> From: Peng Fan <peng.fan@nxp.com>
>
> Replace the hardcoded of_machine_is_compatible() if-else chain and the
> static string allowlist with a proper of_device_id match table carrying
> per-SoC data via the .data field.
>
> This eliminates the static local variable anti-pattern for daisy_off
> (lazy-initialized, shared across instances) and adopts the idiomatic
> kernel of_machine_get_match_data() APIs.
>
> A new pinctrl_scmi_imx_data struct captures the daisy register offset
> for future extensibility when new SoCs may not use register-offset based
> daisy configuration.
>
> No functional changes.
>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Joy Zou <joy.zou@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

