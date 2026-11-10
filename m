Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0634B606A33C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Nov 2026 00:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K2jjaqZy;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PHXy1+qA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=; b=K2jjaqZycpJJQP7OBMv3FRUlw6
	C/pZU0GRKeh2ARmxxS/CmFhZZK20pdr/aNd/55rhipqaVGv/9+AIMcw7kZfUF8KC5fuIxbi8aSED0
	V5LG4CNfTCr4fy+mN2tuHFPLCCuuqfRJ9VM7VOLhHGXTh8VYmsBdNhx9b/q13BcVJeNm5G/j5mdeB
	GVs8TCW5PIanmR11BP1Z6xYUNvydr6fAt+88Jnx3J3tN71p1xs6e9TXPsBIVx3z+4kfbqQUk1P64w
	hu91C8vILhJx4FQwBnyiXBpx4MLVHKWHVbv1Y3jlZQ0WYpJvFjw8enjZPR2zcHfucJx2gpRzuCny8
	5ffoV8aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZwz-000000022Zm-3m5H;
	Tue, 10 Nov 2026 00:43:01 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQZwx-000000022Z4-0bJz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Nov 2026 00:43:00 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-6b70880c0a4so1715544a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Nov 2026 16:42:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794271377; cv=none;
        d=google.com; s=arc-20260327;
        b=rvjMioiueJ/RVWmN8n7VBM4UgvfDLBphLpIVM7XfCXvb5Mj8QEdzDRSmvQQqkN1Gm6
         qQAfoS5P80IvyexhF2kvmYb1axaSmaQ041GIjIE0aTqwInZ1KuwFbf0QKz9PW1QMyNT7
         dVbZW55TX56OlXbrsCfeSv3mUz7n4Cmu+aN3lyueedNGYz7t7LTqlWVijkdKR+hEJPk7
         kfPLJxjL2ULfxcjCtenYwMsqeFfWU/yhoJBoVAvEMgz5xw33R3K20JIwNkyTaxZrbUzA
         sam++qUh0gD6qkUwK5sMc7sy84oqVygFX99ztPZJyGxQuK+UPLCEd5UYkmKPfvHmN7ZG
         b2Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
        fh=UwFQofFQ71xX3FKozCYykXYV1a/aYMMWqqSgcz1IbVA=;
        b=QY486iT8cpZdlSvDy3yf/HZNjJOHBIUqWS0Acs/rh8yL1MMh4dOybP4jjauoRJMebc
         jLlCvlu7wy0tVuI801Cxly047frvmVrgXWdlmUCDHu31qJYoUgvrgg+/IMYxvo39BDAr
         5kmQ5i+iVk9BjEC/QZYWndB/ns/2/ZRYiShS750Eadm4gu4OQnX7syH5FJyzJm2fcFTg
         mgxbc+hm6fyU5kq+UM2a6NCSNDL5Chim8DOJXNpmMYRTtLPmOVT2nLXtiKS6zZyarS7Q
         vSOmYj+VHxLsp5vG+01cqIrWHHO+mf5cA3IiApypLRRrYq83RHrX+0R9jfwDhLqG7Zne
         gyZA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794271377; x=1794876177; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
        b=PHXy1+qA7rd44HSsYQOg7XMF5v/KJC5VfZ5AIVDZ5djh152NUq3TcsM4VylD0fwCcK
         WFw/0EUSy3Fqsgr49dYoSKOpUHM+8W+MWYf0uGYbyMM2IkMlqkbIyBONbBsYtuAocVLm
         JaffKji+vZa5/6Z+3B5jUKPYRyMdYKztWyDXc4wP/eqaprQUt8sU7k0p3OevEAeE1m9P
         mO7IZLT3Pi6o8Ag03oDn2t06zZCBf6UHs78frjewb485onHtmxvoLGa2HLHn9hAGyCGR
         MQ0uS2pwzZfrt+TiZhZWPnk34LB4bsjoFQInGymxZ9n2NcboeninxoBIyoKF6lEthwLa
         5n7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271377; x=1794876177;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QPGn/2cy7Zi3jVYB5TbulGSrRmUDAng3X7AvBZrHC8w=;
        b=23nWSfaqGw3DGP5JHOL8Mk03YiZq97uFkSIzl/gjvrCeIBkLPZVOBGDiwCvX9CNRuy
         Ex0M+BQtckTw8bSuMEkjOlMJwy9L3rxsDMbFdEHeZfE33cseZLQhH7Ko06zO4Coe/2JO
         PlK1j4BC4/uewKGfvnKLUi2NEuKjCAKO/1wV6mq+0DhKHtxno+PWzYuS4Bx8FeCdYuaW
         Pl+UcqEOXEhQS/tvl4T4dalojDbX8xWhyolg0PfZGVEnhWViQrJCghMzT4hjTckXecIY
         rmf/ruis28onMIKuVM7kiP6dR0ibKBKPqBqp3rHvBhucO5H4m0Qb5MIL0CvRGulm1HcC
         mDtw==
X-Forwarded-Encrypted: i=1; AL+hErGUifzW5yuq0+qjKhHZV0wRHnLCm/s6J3vAugtVvh64YqJjsTjFVxItkwULP5FYHqDP4EHMCUTwVMmCc80w3QTM@lists.infradead.org
X-Gm-Message-State: APuU4Z/lpbhbWOTsUx7iHVt46EFDNhU60n7z83p0f4256yxTboaWu4eX
	HNtHTCYNTDDc102b4a7Azel+F6e+h3Xp7tzwaMHkAbnI0m54/oWtV35/4QG5p3z9vu6UU9aAjQP
	cIMBTONPZwUVe6Vvzkcr8QavFAVZjDw==
X-Gm-Gg: AYBFou2rbJmkaIH/kKCpXb7GCIPae0nRXPYv6H1e6y2hkuCpaxkGkjvsgM1oyg76w2/
	21jNQs0yTsaWZpHxzsnYJMEUE9AF/S2baTOilgF/a6ilfu6Fypw3kmCZRVwdeiJhQWSmvquCQCk
	htFj0erZeB44/T2uIbkC0o0Z5FLaPkP5Dmnu8QmI6pXrrhBm5L0kDowcgTYeIsvZ8khWFAxNKyC
	Angn56FSry2eSwoRuEYnWsSp+z/6m2qU584F5cwf5HfivhZQ9oJUFMRsrKeyJW8RaUcYvi9XKcU
	3weS8jBy0/ihclGnCoxROKDIrMSDbT7YxlL0tc/SeKTY5D3WiT/u9HOyEaGlw8H+Zg7vGLH4WxH
	lD8zvTpoFU70eemM9UqJqT6K5ada+L+E9iheW4BzQhY4W9Kd+S3ERU9/mAPZarJHG8K0osw0sIw
	fJUssrKLPsPP88y65K37smQpbiKJqM+BtioAePrWOb2tco
X-Received: by 2002:a17:906:c112:b0:c46:cc9e:a14d with SMTP id
 a640c23a62f3a-c50496b04demr61764366b.49.1794271376660; Mon, 09 Nov 2026
 16:42:56 -0800 (PST)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Tue, 10 Nov 2026 00:42:55 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: mhun512@gmail.com
Date: Tue, 10 Nov 2026 00:42:55 +0000
X-Gm-Features: AclHuK_Nbr-5sULo1t7fMr0l5xY8-e0EITNYi6BiM4aUVU01eCDOgyeriNaujDc
Message-ID: <CAGEsz8ENCW++SA9cdh5=2EVmto=2-2axzTwuNhaKv+xW02Vvtg@mail.gmail.com>
Subject: [PATCH v2 0/2] dmaengine: stm32-dma3: fix provider and clock teardown
To: amelie.delaunay@foss.st.com, vkoul@kernel.org, dmaengine@vger.kernel.org
Cc: Frank.Li@kernel.org, mcoquelin.stm32@gmail.com, 
	alexandre.torgue@foss.st.com, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_164259_198339_578E3E69 
X-CRM114-Status: UNSURE (   4.26  )
X-CRM114-Notice: Please train this message.
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

Split OF provider teardown from the managed clock cleanup requested in the
review of the original patch. Patch 1 unregisters the provider on removal;
patch 2 returns the active clock reference after managed DMA/IRQ teardown.

Keep the existing remove-time runtime PM disable barrier. Check initial PM
activation failure, and let devres handle later probe failures. Remove the
manual IRQ-free loop from the original submission.

No hardware runtime testing.

