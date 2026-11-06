Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D8C606A32D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 18:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=G0lQCFez;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TEBAhAmn
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=; b=G0lQCFez+MlCSYsdMDAxOC+tmd
	k+JC3RwkM5hxqeqNTtlAFTRBcF+5btfL5CqCqY4TvExc2GeerHXoHrrz3/ltn5wbWbKsw8mlvxCAl
	mAbKTrXBMGQ2cOnFDwiu5izyUsqSoGdLLFFeWbRxAl7e6fZ6SONVIzF6ADlzJ5bmgc98KQ0yA4Jc3
	djR0vyD88baNGbvHd9Mirsiv9MC4acb4ZGyZvxpMj1UnUkDSqjs4019Usb17Ve2BRmn3o2PG+ud5i
	hYshG4huEuflMxpWYCp3y1oQws67WNbDK5rdIMPLcECsftarKBZ+Dnyt/hK+wKHWu5GTbRM7Bp+A3
	06QknSGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOMc-0000000DLhY-0MGU;
	Fri, 06 Nov 2026 18:08:34 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPOMY-0000000DLfU-2G6C
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 18:08:32 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-1a3c08d6928so1679417c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Nov 2026 10:08:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793988510; x=1794593310; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=;
        b=TEBAhAmnSoGyxIkeT12Rdn6L7uidFXASr/rRbtkA8PwGceoheeP4m//EVWG4wFFTHX
         kI4230V2y6M0o7FQeL8MN9pA3NCw89kDw92LUzjNKYtyeXHUKTQtxZ8d15BRp+VU/mu2
         hc3bKLeGhPQ00BBCBL9s/HM5xkQrXxGyUtaWMxYyuh0g6I0wNUVw3t7WUucwHUxvSlAb
         Z44Zq3vV45WRszzkN6dhvxHXkQ/ftsp9Qu+QyolipregUOv0M7ckhA4Mu4+yFw+KDY3F
         DDlZHQSZFdWzDr3Acj+wCafXsFdSvO4ZyPdtx9e6dYknvE96Z+Ve3vaL4RsAqrg9ZYwg
         ogkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988510; x=1794593310;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TlsbZRohfYY9Acfo1HZrz4sd0DFYcL5H6Bh8ImzlihE=;
        b=dkGAc7mJrBdFe8/DnBQMdBWHyMsCrIrHGJshRTA8xSHoVZ0nnl3ungSvxOTzZbFvMf
         7iWbB8vLGpd8iGRAMzUjeEwGv/eMQUqLE12LVsbahYWnlN6TGQmM2nwAhwJJ31+o28KD
         IKVqnWXCb9uWSSZr/RVyT0AnaFzgrdyCjmCpGTjk4Ryzg2r+E/GH7rolz4xDTX7C/Txv
         oxQykeYm3C0W/AY3gdsa7JaTQnS43RidVExhbzFwP09Z89W9g5ktLuU62h9Kxw8EViYf
         fRfnFDu4HJGQeKGwrYJ6bdEzsr+C9O0W3sJtSfHdRZsW26SBCvQMy5IUHm5xWJhfIhMo
         YL/Q==
X-Forwarded-Encrypted: i=1; AKwUvBwcjzs/UAVQ6kvzAmluqTJTnCfyIgdIGhHU6jcXhYfvlULpiZ7uYgO069jUNi1RTYMYpWmy1OOdv9TrGvagUHPP@lists.infradead.org
X-Gm-Message-State: APuU4Z/SDMC9UvRBS66C2YLqewjTLLlOMiW0GwC12Ng+HTcsZ0xYNJD2
	QmT2SmNSokyrR/fc73wgcj6dNndmn6OGK81edUb1uszYexf/bxHKiegw
X-Gm-Gg: AYBFou397FH88Opp/EtjDo3xZ+bneSrLXi1W2qnxCpuv2tlg/o8tBvT+NgXLHaLQNtl
	QPf4HI60U3RBK0f0EU2EgEkYnxtBH+xHLL7DvHYEB11nyQlMEuxQn17YwI4BLdNjeq1WGo5zpPd
	Ii1UIyfcecs+GP/PfYwA1mwS++/fE3mnT97S26iG+/Icxo2s0xWJQcvEUbQDXqIjCUnHVWK08eV
	stVwU57KHH5isOiWWdCK2WpuW6o1loWaXcQutINC2n8y5c7bxIlwczLrImydNtZCV6+b/nOwV0H
	vdXrGT8Yxo2bmGJDCAOQ8hmuUh7olutJeT1U1GqCnsM+b1Yw9e1CP/0YSET/ZuOkhkBr+HHmSYW
	58btVjIgZNycOtiCF0tcFgNh+1KToWYuR/GCNUA0qN0/Ovcrnmcy7+fBkENPnkmKhylvltTO+6N
	Hs5rggnQpThDUeudP3MjAO1mzOTCyrT2YTrqUezPhwulpytwDvA0kD4QUlLfuXcqBL6QC/+bCdF
	rHkc4sLh4vsNzjhUG4YxI+84NJORjUMe+zodgE7uaJIGGIidpWHopVcZZ+J5+FZkR1utueIO0eX
	8WIyaZzt1e7jNRYGJ0O0YGsqpp91snqk9C+X0ILz4ZoDcwM1UE8q5jCDu3MdGCcEBuGA
X-Received: by 2002:a05:7022:5f07:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b25d31e658mr3453567c88.10.1793988509569;
        Fri, 06 Nov 2026 10:08:29 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4fd2d6sm7443467c88.23.2026.11.06.10.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:08:29 -0800 (PST)
Date: Fri, 6 Nov 2026 10:08:25 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: rva333@protonmail.com
Cc: Mattijs Korpershoek <mkorpershoek@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: input: mediatek,mt6779-keypad: add mt6595
Message-ID: <au4Xis7Ei2th7xFZ@google.com>
References: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105-6595-dt-keypad-v1-1-f0911f40d3ad@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261106_100830_578694_33AC2F8E 
X-CRM114-Status: GOOD (  10.26  )
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

On Thu, Nov 05, 2026 at 01:29:12PM +0200, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add a compatible string for the mt6595 keypad, that is compatible with
> mt6779.
> 
> Signed-off-by: Roman Vivchar <rva333@protonmail.com>

Applied, thank you.

-- 
Dmitry

