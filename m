Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A6B606A335
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 19:47:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nWLfm+K4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QRqIr+h3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Dyq7CXm4eP3CnlrPx8cI2jgz3Z98ATLqm3BZ7cAURRk=; b=nWLfm+K4dXHvjT
	EVRi+FJ/aEacDSZOlV0f1opQHrSVeT3qmq4NEE/EGDDJNIV+JHjV6Z3d+Ai7aJc6KQoD5RZoyHGhc
	mUp6uNS5n2VCs3OSPmzuESSK5d6I3sYEjXOC6y2xHbxM8g44788Q/gCcWTgM8QhHoM1Otwk5TYuY8
	1qP4RDn2Yiwe355St6iKtZUkB1YRE6dOLKqvhhFArkeJpaghFOEFSzxl2eSaUAUs6NFrtGi3Z0P6W
	qNVqk++/Y/YzT82IQRO6rjztus8kS5qjl/p+Mw3roSQGNlVqknd5osgKadM/XnUes2Q85U3aEShqH
	hJTrOp/GBIcqaC3iTvdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxEk-0000000EHNp-0idW;
	Fri, 13 Nov 2026 19:47:02 +0000
Received: from mail-oo2-x05.google.com ([2607:f8b0:4864:31::5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRxEg-0000000EHMh-41eL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 19:47:00 +0000
Received: by mail-oo2-x05.google.com with SMTP id 46e09a7af769-86203d56413so137192a34.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Nov 2026 11:46:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794599218; x=1795204018; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dyq7CXm4eP3CnlrPx8cI2jgz3Z98ATLqm3BZ7cAURRk=;
        b=QRqIr+h342dAAs5jdXhEFGPdYpLSGMtyjtJk3Qxu9BvQKnC2o9ixnBrOyVZVX5vWv4
         aIFtr1abOYNG6KqyhLWpwsNLAv8JWZ90YwsK/vkvu31utvHLVdjT9nXOXFzS9e9mlsHR
         0xhbzw2dHuzpSNt3meYul8K7CVxBOYOBprDyNk06HN8jxEUJmp8ifGukjHN1tUPDMNXO
         HsxxF3Pao184GHLNdRJ3DGHGqOTm2AzO89QJU/eJD897WqMR/BjqKpsDrfVQxteWjYF0
         smUyql0Ro1TJ5YDiFSZr3yRjaC767r4gmJJG8w+G6yhBaVizGIz5/okmiJ2Wi2/WdKVQ
         viyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794599218; x=1795204018;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dyq7CXm4eP3CnlrPx8cI2jgz3Z98ATLqm3BZ7cAURRk=;
        b=doAPzXD8rwIEMpzuc2PI4Li2j5mmxRKIuaBuO6ZvXzC8jIrZZYBVCf29BT9DQgZBO1
         Ngpyfa2pTlCPz0Kushq/sBx2av0/5tS8kjLa07gFxBu+Ftyn8PsorbdAEscl8AQ0v/S+
         MOJtBhp9SIbaivw46TytHI+MqK+Gph1J0tqGVMPDcmLoyiRD7B11Ajv1+gI70pVjNJmh
         6G1lNepQGShCpimzc1Cr9viL01nqbRkI2nnFfOW9O3NNX/wuLXCZ2MI6sUahGNaRiUEJ
         ZHA3gRJimrR0yFz+53r8KfvwvBpBISn2SBurqA8/vSuAF8eVu2LerlA418+t92qkOq2J
         bT4A==
X-Forwarded-Encrypted: i=1; AL+hErE41uXV6DGuAJEyo/2LvYbWhsTBDk6YHuE6m6U8soK3dcuHNyx+uIEH9aZEMM8Bu1ENJKbMsL9ltuM3ED2ZaJ6e@lists.infradead.org
X-Gm-Message-State: APuU4Z9QpAv6YKBOUQcdUzTeFP5CmvySLV9YaXkbwEZJror2EB6n5MDi
	4KoptIa37XTcPGKxxtjWB/R06T6GA9yA5BdHxgNUBzlmh9q+jGTUg+Re
X-Gm-Gg: AYBFou3jq2LycpHbAVJJe5ZKO6YCePQ/PVLySgjCOHftT0ZGXZSWe0BcKNT6wI0E7WL
	2OpNQK50Ymf04F4gj5L0g6DXX+J3K/mbaeCCz09h9OqLhXayuZMl2saBgWGSLv4HRLGzc1Ln3l/
	vAhGSvRuIWOFNA1Y6XabUjFr3dGU6HetEBqOa/3gP24YdC0gI084CC2OfJycxeTZ+Kreanmnjyq
	CNvXw6j5tI7PkN5PIYfdX6akpuBj5Zjdk4bn3gbKrHV0CWmS/8/d3MCOHGo07YpVMeQxRb246uZ
	fOlz8mVOMnXwcM2kolp+xsiTwrvF9XFh3dUSMvTOJ7/KWm7EW7pQqj8sC9uV2klXHtuJQK2Rcxa
	BcwjYusPA0WuJtm0rV33XdZ7y/e5vbTjyxYvuGVxgRfXbdyWvZJ3j6x8Jh5RVA3XjSHnfKR7fD/
	kmMKYxWyuT2kO1RWztAvA8rRL/yrvBGyPBpfgDFE8zbKeBbiXj6wKussXYWwfXWrH2B7EKs9JUF
	6zyvSyRZgVWfg414B5J61dDZcfcOsXvO0eTfVF5us+WpAueD69R4tWxFUtNj7KlLOk1rNhbL986
	VTwALV19qHNqnYFfZUjBzIqfMfULIH0ajxkYWOuqtbNXFavbtV5Es+i1KEnc8Fy3i8D7stuw6aI
	JLxsUGX0nTYxwCohE+iu1
X-Received: by 2002:a05:6830:4421:b0:862:a0ce:f55d with SMTP id 46e09a7af769-862a0cefa5emr249700a34.21.1794599217866;
        Fri, 13 Nov 2026 11:46:57 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8629d280975sm811328a34.21.2026.11.13.11.46.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 11:46:57 -0800 (PST)
Message-ID: <9fd550c5-292b-4974-a667-9a6f33f2528a@gmail.com>
Date: Fri, 13 Nov 2026 13:46:56 -0600
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pmdomain: mediatek: Don't power cycle domains on probe
 deferral
To: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Cc: Ulf Hansson <ulfh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Enric Balletbo i Serra <eballetbo@kernel.org>,
 Matthias Brugger <mbrugger@suse.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20261101-rbrue-suez-upstreaming-mtk-pmdomain-defer-v1-1-b4c41cf3935f@gmail.com>
 <CAPx+jO94U8b_PNJbbuzzFtF2HFeM7sYaT+oZoLJUfvThXkFYjA@mail.gmail.com>
Content-Language: en-US
From: Ryan Brue <ryanbrue.dev@gmail.com>
In-Reply-To: <CAPx+jO94U8b_PNJbbuzzFtF2HFeM7sYaT+oZoLJUfvThXkFYjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_114659_007758_0BF9B3A0 
X-CRM114-Status: GOOD (  10.29  )
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
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/13/26 11:48 AM, Ulf Hansson wrote:
> This looks good to me. However, the patch no longer applies to my
> fixes branch, due to other related patches being queued.
>
> Please rebase and resubmit a new version.
>
> Kind regards
> Uffe

Hi Uffe,

I have a v2 already out at [1]. v2 should apply cleanly, but let me know 
if you'd like me to resend v2!

[1] 
https://lore.kernel.org/all/20261110-rbrue-suez-upstreaming-mtk-pmdomain-defer-v2-1-3ad9ad0cc67c@gmail.com/

Best Regards,
Ryan Brue

