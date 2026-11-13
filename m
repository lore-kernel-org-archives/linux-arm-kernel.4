Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38B7F606B273
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 11:03:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DUpyr6AR;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=e2gq6NZ4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=; b=DUpyr6ARiWW0lJmeSa3TxqjK5v
	/Q/x5Htu406ptOTyfoU9l7IYOO55XRZR96DEeumRbE57zBAWmW4ecX6AGt9WYyzUdP2uCIEZPvfBS
	Epznbh6gCFfcK1ENpVZdCZhj7kANLCpDWztvmz14SwAAtFYemOJ60Gl0OlJLdMr7HT9WwvOg8PfIx
	RP/DQARdQgbcVSujPqlxh2qV9ThkiZst02OLg96cGBYXb4hlSjUo7OlIfAkkXX7l6jhlwtNrR4Dz7
	qFphBtHbL9cDVrg4/2eYE9kAYTIYyUBcHU+O16KFaXmfqgbQ/3uKQPTxP92/GgJAr8WkWbmlnIkBa
	CB1NhMgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp3c-0000000CS5t-0QB1;
	Fri, 13 Nov 2026 11:03:00 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRp3Y-0000000CS4v-3z3M
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 11:02:59 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-6b408f2d936so1549122a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 03:02:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794567775; cv=none;
        d=google.com; s=arc-20260327;
        b=IFso/PPRdtMBDl9r+4JMtHlII26cue0ReqqN5gaqn+k8KTwtHaxCQp+vwtqnoaDFcA
         DvhNNHFtxYChHXfooI8ECMLboF36ssAVbyiMuJUFxJtoEmqtAuZRS80cQZI5Hnc9Ey5a
         m2IVsvdwD1K3PbpMEg0JUXq9kC1JKyap2rZpfruDkJDEB3vRZGlxaRb2sl8lxP43yk5D
         sbzwaPji7Gp2AU5XKVBQNwO8lGnQPHSeUGe5etvtUSKx/HGhx6P+JyrPRYIKhANLiDds
         I829BAl+XAMJckQrCRdR+UN1vJdu2KngUBNkC138XR3s7L3n1goCtZlgDhfWgRZbeaC5
         MPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        fh=txGt7Yf0slW0EFNkNI0fi1rCPT4WbHB7lmViZNZzjNo=;
        b=fEpqgQgSAJWM0QH+zJDWEHa6Ysms9y4cNThREePa3sp+GYsp+MWiJ4jXPP04yNDzn/
         cE83nhg2PDELFEA2lyuC9Jv7M+Sf6km7+R3n0NOQx3TmvIdUhU/Y1kaXYdD7NFuZ9Rec
         GobOVjXpHOrYLxph+aTtkMZ1BPjHwJNdlLJsxJQQxfxbuXE/Qyw8Xb6Fk0RuPCAs6X8N
         i80LumSuqMQNTPAAgJHZN2p3jCDeLaLImmvve3NL0UpuK+vrm75LIqXCqT/d4jbOnvpt
         2L4ayzu2v4PM2xYjCs0oMJjtcboINDtRgL2Imxy4BEpySO4w16tKqw/BGlcqzDfjSdOy
         0VWg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794567775; x=1795172575; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        b=e2gq6NZ4eSSlU2bLK+iinQrXTP+qOVW3PaXhtnfKE2CDh4lw5XlQrzr3ydDPweM9lY
         lDLesscEGWgwpqRAvmJcLLA/9CeTMlDLlq+DP17zJzHG7BLse/+cbZxDQ8M3optTPdi9
         Lq6NbBwkqVBIEdGGThNFSNIqjPACJYcRGM2uBrAOSYG5TP22sXGXhdHfnSiEBae/iyWm
         e48Y+YBb9/q9EZnUzlmAYbDh+1OjxqPywI81vCO/BT3O+EA3aECm1aJhbPRzx66hzE4O
         iRPD/dBWaUQ/5xwaNlspV+emxojZ6FdNhF/FvqF5f8r03avOJtVyt3cdl9NlrhyD3Pwa
         jIKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567775; x=1795172575;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cnBurJ7zmT1evvY005qDgFpHdZ3WLhIUwmhdRCCTod8=;
        b=xeRETQZe4yaqltD7KXKYZ/RyIiSYtSjpYCix6EhHKTlxmzuebvmHqO7mfJ8lLjayQ9
         qsz1OT/gQk8QnuvgCSay4QekyyIChElhqm0FRQg6tq3gKQ/VttdXez8MumzReA1l4/c3
         NTfbpoITgF4zxV/CxpsPv2PAsq+V+xjM21Oee2Y5iVhsLxg8KmVLCNK+AVAoNRVGIk66
         7ze5ffv75X04VzZGlU2vGF6vP7Pth1k8g3clbyIhGovsZI6ddjxohKye90OUCBF055OO
         CxReQbpe/heAp/oNMWuhg3KWyB4/wG8aDZZFrkKoct5+KBKS+F0OD+EfMuLf7ppAgiM5
         RYPg==
X-Forwarded-Encrypted: i=1; AL+hErEh/gZZ/akLGWtVABshnIPGjryd9Z7cJQ47FVnhCxNzzCWePXLHzUZLMlvUQ6UvR9mX8BSLeghkCxdOB4xXl7Nn@lists.infradead.org
X-Gm-Message-State: APuU4Z+Wj+lLVJqPWOiBcZVm/eU5joDZNFZ39yiGMj4qR7CL2KPK3Mlz
	3ObwsYLZzQD62DgXEXZyiuyQUEjVDvlrNMpItVGzhrYrz8ec/uZUuIzo31bALgOd6D/kvRT8qfX
	/+AC3cAV4y8TqGzNXkR3Izeye4tV3D7ikGiDjVGgiow==
X-Gm-Gg: AYBFou3mDthECqBDfGQST6kXd6IB0Zv7ihBd/jks5rBjRXANUsjN0DpHpCYrtxc10qm
	GRgDovgxg6fsdeWkjTksXA2ai/AKcEwX2KLRFSnWxGZrRdqPPlXdVNCnL77a+k9sD6tCzCdTgYI
	sqo6J0BVOpR/QP85ZNjdjlM9zSk2YkMShtEhb/X5eq3NhUaL6+Hz2XMaL+tN/VMPMaKaaObeBRH
	+DpWcdc9OtqAclzpx2lmBo9/36ph33v9hPgO3MH+amawyCc7LpzWJcXC49aqor/EhaNVdN5DIZI
	Z31iVYaU4kWjbvIuFkXDlNnrW5RN8mknnvGEAWyEmUlxhEs378QlJQYuqzIFQ+CDLRCoNNb84n8
	7uhmHsddW9S08DumCff1cyPpRi9vNvsBvGWaU8jBInrDq4+yEG6oi+ytP1xE53LivbrZb7w==
X-Received: by 2002:a05:6402:13d1:b0:6b7:709f:85f with SMTP id
 4fb4d7f45d1cf-6b7c0c7fbb1mr1715682a12.36.1794567774860; Fri, 13 Nov 2026
 03:02:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <CGME20261113104841epcas5p2823126ce22f44cc98fcbdf94403c32e3@epcas5p2.samsung.com>
 <20261113110612.3265841-1-raghav.s@samsung.com> <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
In-Reply-To: <1771243284.81794567483188.JavaMail.epsvc@epcpadp2new>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 13 Nov 2026 11:02:43 +0000
X-Gm-Features: AclHuK-cUPGFMqYQ4aV0p1o7MZtl5WXavbyl1lomUd6smnM_F6LSvDHUWLAhm10
Message-ID: <CADrjBPq0nD1ENZySUVZvG8gWGpYrf1464MMau9VswjfosHU6Wg@mail.gmail.com>
Subject: Re: [PATCH v3 04/14 RESEND] dt-bindings: clock: exynos8855: add hsi
 clock definitions
To: Raghav Sharma <raghav.s@samsung.com>
Cc: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com, 
	alim.akhtar@samsung.com, sboyd@kernel.org, bmasney+clk@redhat.com, 
	jbrunet+clk@baylibre.com, robh@kernel.org, conor+dt@kernel.org, 
	linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com, 
	pokala.reddy@samsung.com, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_030257_976785_EDEFE16E 
X-CRM114-Status: GOOD (  13.86  )
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

On Fri, 13 Nov 2026 at 10:58, Raghav Sharma <raghav.s@samsung.com> wrote:
>
> Add device tree clock binding definitions for CMU_HSI
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
> ---

Reviewed-by: Peter Griffin <peter.griffin@linaro.org>

>  .../clock/samsung,exynos8855-clock.yaml       | 21 +++++++++++++++++++
>  .../dt-bindings/clock/samsung,exynos8855.h    |  8 +++++++
>  2 files changed, 29 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> index 53fc8040e173..21928235d131 100644
> --- a/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/samsung,exynos8855-clock.yaml
> @@ -28,6 +28,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - samsung,exynos8855-cmu-hsi
>        - samsung,exynos8855-cmu-peric
>        - samsung,exynos8855-cmu-peris
>        - samsung,exynos8855-cmu-top
> @@ -52,6 +53,26 @@ properties:
>        Phandle to system registers interface.
>
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-cmu-hsi
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: External reference clock (76.8 MHz)
> +            - description: CMU_HSI NOC clock (from CMU_TOP)
> +            - description: CMU_HSI UFS_EMBD clock (from CMU_TOP)
> +
> +        clock-names:
> +          items:
> +            - const: oscclk
> +            - const: bus
> +            - const: ufs_embd
> +
>    - if:
>        properties:
>          compatible:
> diff --git a/include/dt-bindings/clock/samsung,exynos8855.h b/include/dt-bindings/clock/samsung,exynos8855.h
> index 5d8b38a744b5..67cd97d8fab8 100644
> --- a/include/dt-bindings/clock/samsung,exynos8855.h
> +++ b/include/dt-bindings/clock/samsung,exynos8855.h
> @@ -214,4 +214,12 @@
>  #define CLK_GOUT_WDT0_PERIS                8
>  #define CLK_GOUT_WDT1_PERIS                9
>
> +/* CMU_HSI */
> +#define CLK_MOUT_HSI_NOC_USER              1
> +#define CLK_MOUT_HSI_UFS_EMBD_USER         2
> +#define CLK_GOUT_CMU_HSI                   3
> +#define CLK_GOUT_SYSREG_HSI                4
> +#define CLK_GOUT_UFS_EMBD_ACLK_HSI         5
> +#define CLK_GOUT_UFS_EMBD_UNIPRO_HSI       6
> +
>  #endif /* _DT_BINDINGS_CLOCK_EXYNOS8855_H */
> --
> 2.34.1
>
>

