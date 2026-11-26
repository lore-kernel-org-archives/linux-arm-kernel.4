Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B40A2606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Nov 2026 20:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=x4VSR0v9;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jekyMqzI
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=; b=x4VSR0v9chjjiu
	i/9IpOe6Zg6nwxPWjaefSIDHBnj7yrbKGD3N8skA9x9ggF8yoQOhgLyRaaq9UISPRCg/UBRjMmKf+
	YZEOV8Mdjctct9ikbqgMzw/qtk/Y1ztML2KjiRjyiEz/D71vzMgBcg+AZxzEU+um7s1d1cEym3e65
	ZuY0TVvsIm9CAvqJUveKcsuL3hQQodT3amj3eETipsMINEFV5+ZyEkCJnw0tA7fC3wxRF95hd+J0V
	hr7NI0jBZAz4GVxhG29YwbP37VGL60+Zq0wThrlgyPNyvucGJNSCoJbzkZvOA9qizcFBICd2FHjV3
	SbiMJc2Qroyzs8XwA1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgCh-0000000EULo-41v8;
	Thu, 26 Nov 2026 20:36:28 +0000
Received: from mail-oo1-xc30.google.com ([2607:f8b0:4864:20::c30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWgCc-0000000EUHx-0Xgn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Nov 2026 20:36:23 +0000
Received: by mail-oo1-xc30.google.com with SMTP id 006d021491bc7-6ddef424972so5930331eaf.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Nov 2026 12:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795725381; x=1796330181; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
        b=jekyMqzIa4COq87GzvecD+Ws682hwZM34o1GcJGAjmPaMSj6xVUyJrJ6WymR1ItAO/
         gX6dm8ytUoLIKypNul2h4ftXME7Pm5aPGmfFkckZleegAukD0anOyHPA4bwAqPK1XuQD
         bNEMre0D0nETSdD8EJ07AuL5KA7U5R3Vg3gCJnHj/0r4GTEr4r/FyxRtzZUNjdhWvXAP
         5IM6OlX2Mq9gfXD0SrbUwCGPMHn4FVKGPnW4V2BPK5+FcMKSE5WMkrhrIYeZ/ZowXKoB
         60QocbwaSo+0kAACYklYhuvBKpy+zWQRG8HbnNElpBoSVTVCdIIGvwJcKtN9jippbWOU
         rImw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795725381; x=1796330181;
        h=content-transfer-encoding:mime-version:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAz5nKgdKURm2kGIEFLUS6ajltDqJFpi+dmIBSAUiPE=;
        b=iy6VOTQaXv9wmC32Z/SWyt+B6xIgT4VGhg6yXb3SF9C2ef4q/HVz5A5CFo95qPjNyX
         uOG6aXnGA7d+dgpjF+csNZY/AIW0sg+de7d9c9ahnYy5iZ72ULQ4bEsBln1ZcoZ0cpWs
         fLDpLWGX+OA08ZBl3w2Su1MYzFf6/3d3bBm6WQQBX1Oh7JrLcXpNY7TyhjFdcln/+Xfs
         RzPWkYXVwq02cYhNLkeu0z9X3DNpMrqWD4oZUSA7p0jN2p8iEf2HrCG+AthoDO0ZfG9R
         gpnhjXzHU/cwsGff+5td92dY/gSeOkX+ljSZyQgq/Hvei66d0QtYgxF61+jNcD/793AY
         wuDw==
X-Forwarded-Encrypted: i=1; AL+hErEf7lavJxzBnjuGvEBm7HXvdb7/6PohYuQfM9uuBZcZgzU2Yk66NTNP2PbDPnqD82oPnqsqxPM4rJxa4lxEWcCy@lists.infradead.org
X-Gm-Message-State: APuU4Z/C9dboghzh71INkUFVLqtJVVFw+FJmhznfqryIdNbpBG5TMmmu
	tA+Vnc2/Acuni3hpWNshipKgpyw69ua9FPJyg+iJG4exPbkmiA0SOEwP
X-Gm-Gg: AZFdTZeUWfq0sy3nniqBWFbxVWhwUPCYWEVvIV/5DKvx4Di2kIO5QH3yMC7XiC1RVn8
	W7LRe6Dao+aVNYa7ToIUwmR9eBSpEsQA1R/xmnVrU3t/BFTrcHGviKojOoKx18hMurt9+XKw7Q0
	xnH8qiNYLrEMZ+M6+piC/k6OsISsWqpaqIcn2XBdYnHR+am4Myhc+CtC7+kzxI9MrABfHCurBAM
	CZrPucDp5J/rDcX4Uk8hb9c4GPEQTH2m5w/J+BMkMHaMKDO1rF5IvS5k24rREE5V2K0nmdFgUvB
	C2cZYZpp4KEg6Al2ziNfu5k4hysDFdhSo8Ot4CZOlPCMQJ9foIeWYkyHsLK4r1rT/Wlqcu3Cv/D
	cI8/h69ARK6QKQHNje9GEhKT1r+scZeozQ4i1t8ch9EQ9k//VPMqm42gVa8NHIcO6C430BuDLm0
	/3U3OwVpYegBI89GiR0IELGRFIyE4lt6eNNKlxxiuY1XVQ5TXYSbje8IcnGuK0s7URgfekB5CiB
	buNp+2fACLcP9yE2TWXlCFFGoLhIeZMvwrZIBv0Txh8CRI4eouSKicwXzO/BCYpjw6XtTrVrvrz
	5mcET7VJN5wPUzZ0D9JkQMwsrearI4M4ALjRm7p8OUnvRwNq9kqRGM9FO7TEUDi9vCvbeIeNk7s
	8xErT
X-Received: by 2002:a05:6820:1342:b0:71b:3fec:3915 with SMTP id 006d021491bc7-71b3fec4aa6mr17056260eaf.64.1795725380970;
        Thu, 26 Nov 2026 12:36:20 -0800 (PST)
Received: from AMD.home.internal (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8631670c44dsm15454620a34.0.2026.11.26.12.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 12:36:20 -0800 (PST)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Pablo Mazzini <pmazzini@gmail.com>,
	Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>,
	Alexander Sverdlin <alex@sverdlin.org>,
	Jun Yan <jerrysteve1101@gmail.com>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: arm: sunxi: document Radxa Cubie A7S
Date: Thu, 26 Nov 2026 15:36:18 -0500
Message-ID: <20261125-a733-dt-v4-1-reply2@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
References: <cover.1795034153.git.enzo.adriano.code@gmail.com> <428efa99fdd0182e8bc9a2ed88b78d2cbd36fa45.1795034153.git.enzo.adriano.code@gmail.com> <20261122004008.0ee8e16d@ryzen.lan> <20261121-a733-dt-v4-1-reply@gmail.com> <ebf2d6db-8260-4ac3-8316-ae9a0e5ee1b7@arm.com>
Content-Type: text/plain; charset="us-ascii"
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_123622_178504_9715A30F 
X-CRM114-Status: UNSURE (   9.07  )
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
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> If you respin, can you please add this one as well?

V6 1/5 adds "radxa,cubie-a7z", "allwinner,sun60i-a733" alongside
the A7A and A7S entries.

> could you wait with a potential v6 post until I got that one tested and
> posted? Then you could ideally also include Vinicius' A7Z patch, so that
> we have all in one series, and just need to deal with the dependencies once.

V6 [2] squashes your A7A 1/2 into the common DTSI with your
Co-developed-by and carries your A7A 2/2 DTS unchanged. It also carries
Vinicius's A7Z v2 [1]. Both board patches keep their authors.

[1] https://lore.kernel.org/r/20261125131435.33190-1-vinicius.eduardo.pedrosa@gmail.com
[2] https://lore.kernel.org/r/20261126-a733-cubie-a7s-dt-v6-0@gmail.com

Thanks,
Enzo

