Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1242E606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Nov 2026 09:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=E/lKIvkv;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CI7KwRD6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=L05En4/xKFVGe3YwLYxtCb15h7QwemjDiV1X8U2nthE=; b=E/lKIvkve5Tm4I
	FT0mdTaazSZ7y7Yt8sfQNHI9KD76tPla2LF0qhE9LEo3a5gucVT4jkmuNk2HRWi3n1PLcBOgePNw3
	VSr9JupdBJdj99ABuCU7upjev4UtvziPHgZqXVbiQMNkCoyra2TyJrFlUtPwPWcTKVdMG47hH421P
	ciU+NTUgqSk1dVWX7g/TiO8eP8nIcdyD0f1J4VnOACsRlVyupwMLjYWSNKQHF66EROJO2rm4swyHj
	uxT7NPooPQ8g6bpj9ic8j+2thyNQ1gOng37Am8oP1Rzmw0GAGPQs2P3VbiWvjfk6HqPIwyPH37HJH
	Zr4sI2q9nrf2AcnmQQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7It-00000008q6n-3jis;
	Wed, 25 Nov 2026 07:20:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7It-00000008q6V-15qq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Nov 2026 07:20:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0DB3406A1;
	Wed, 25 Nov 2026 07:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850C01F000C0;
	Wed, 25 Nov 2026 07:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795591230;
	bh=L05En4/xKFVGe3YwLYxtCb15h7QwemjDiV1X8U2nthE=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=CI7KwRD6/npgdogDA9soGnOx7aANCu/YHtpit9WlZvZg6ZNb5WZ91xuGXsP7htK9g
	 AxNgBw6ZxZd2f6JTLRrLXyyVsLDB2JfUyK36sJdxvwYfems3TDhQd04jFCNZHUrli+
	 l9j3qtu5KNZ+lerE4srjbX7HELfzHhrXTwjDtie0f7LzJhHXJcf8ZhmnytnfsAeBt8
	 Ya9P518uE9M3mZKCYl9KJzZwloz+9LV+RQrwPgXWYdEYLkvFo/XXGHbWsDXoz74ntk
	 11l/Lw54Z67R5RWw+J/uPKkCX/Xq3kJj1uph9H+K3yqDaBXtcDYx3Agm//IrDrHZ3N
	 5N2FqPYzw3twQ==
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/9] dt-bindings: mfd: Add Marvell AP806/CP110
 system controller schema
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 mfd@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261124-dtbs-marvell-v2-1-663009a769da@kernel.org>
References: <20261124-dtbs-marvell-v2-0-663009a769da@kernel.org>
 <20261124-dtbs-marvell-v2-1-663009a769da@kernel.org>
Date: Wed, 25 Nov 2026 08:20:26 +0100
Message-Id: <179559122613.9063.9445094754243687783.b4-reply@b4>
X-Mailer: b4 0.17-dev
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 2026-11-24 14:46 -0600, Rob Herring (Arm) wrote:
> The Marvell AP806 and CP110 lack specific compatibles. Add a dedicated
> schema for the Marvell AP806 and CP110 system controllers and their
> child devices.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>  - Update compatibles to avoid old legacy ones
> ---
>  .../mfd/marvell,ap806-cp110-system-controller.yaml | 59 ++++++++++++++++++++++
>  1 file changed, 59 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>

