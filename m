Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490AB60A2611
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Nov 2026 00:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IbGZg+rl;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=c3009k59
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=TLSoNOX6uS4sPZRd9R7wxC2dIndj7/ZIeTA82tCUCSE=; b=IbGZg+rliKRq6q
	/PbFH/jm2U75DvhO6t+W8jJnLK7WEnPdyKLuZHzACJS8PL4zxnGtyMvKlmS656eTKpljcPYNzN6RU
	wueGLe9sbr2/MEt8jzHNPlmjn55p4gHpmz4HhHKTArxPuZzeeOnEXEW7b1B21WvXRZs+eXtUAbTGL
	kHq5uLPYayXdTWOhFvoBnaODnfdTCAQb4ikIpRsapCa77uDXoyjWjjfexYKzSy/7DuOuu8C6NMpas
	0cnIoeNdt0lzf+W+2tjomBsRusk6dJ/xb6QTX5yhn/8jf+tIYGWm5WAeSFm+poSEe+b8hDh6LvqRd
	4v/p1mmXyh7dCdLL0vxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGk-0000000BKhs-0bb5;
	Fri, 13 Nov 2026 00:35:54 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfGg-0000000BKfm-37XX
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Nov 2026 00:35:51 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-4919a880834so158177f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 12 Nov 2026 16:35:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794530149; x=1795134949; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TLSoNOX6uS4sPZRd9R7wxC2dIndj7/ZIeTA82tCUCSE=;
        b=c3009k59g2EBczSm2Qatea7v6Big47G+McuSQ00GHM1cbjxYdYxyYgsMCfFXsvxSqa
         HPGG9XRGawuW3XrM6wOca6HxfOCBEkccCBra2PL8YBmX7kgTqDEUdEFrlh6jWO1wZOs2
         pEzB7AJQNThCqsPBEk/y8IMX4Oy8DFmCsfgGiDCb5qxWmCgbjS8N1dg7rwe2H1Kx/MGe
         02BXWkCA4/eoNx7CZXylye5aUZDYnht+1gj5NWl5+4Mo1W6uTrPysyWuDit8fD+W3KGe
         Iqls0gRFmA0Hge6qtx9tbz92shXD8wqMaCSe+NVmiF7pGOzE8L9NpGowj8WSgrThvDrV
         INlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794530149; x=1795134949;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TLSoNOX6uS4sPZRd9R7wxC2dIndj7/ZIeTA82tCUCSE=;
        b=cxyMeFtXl4amopEDvB25hYZBJeNejQvxSXe4srXdX0BjfAOs7QOpTc4roPPnEMnDm+
         bKvhGMITw60ZbVV9MA628Z4s+mlEVT0Yiwsruz77OYjQKBrMMro8CpbPG7uqukY69kjd
         9QVYDWCbuq38qHbuCGqU6DujIy6VuPBVKNbPYO5/DcuOL2yEBmAFPI1j0d2G6FeWZKZn
         +H1J4CtPOKTIscf17gCOx0IACzQe1JzL4u2Wt3Z7LlgzlVimj15bQ81ZGrSPEExmowPW
         MffK2fcCx3d7gFpBVCuuLh3gMPEDI8KxGQtlQYNfeOWcTvlPqq/TRnsNDEGxxMX1pye3
         zhag==
X-Gm-Message-State: APuU4Z9J1OVIrqkAge11RVK0FncnWWf1QqJsw7qGEICOm0+NX2BvQbnO
	zOXNBoBNAq3LX4e/+ey/JhbJkm9U08MLkH78kzB2gsjXSQ6F5soPRRQv
X-Gm-Gg: AYBFou37BddOqsVOPuberha8xOcN730nKNNsMbP0vTndd8OanQPB7bcsa7HqE18vrLl
	gue6gR7qmKBXfCTunptoZ7JETFnZ+Wuhoaeytvfqp5yOEFFUbMQrzuxt1TfNLNykVgi79aaRsT+
	/YxtFn9bpYtLiH8GsiWTDRYsYo5p7t2bBcdah5LDUe/2nJvmIHFfOMlF8CLKRz90WGUE9Xs+0+k
	QBBKvPdFjIkrEmOLlYC99o8KkR+c9n2RYdezYkV3tEkvimu/rvXc5LvaHR8VJrieK1JdJlSR15V
	g1gQ+4QhL5Cv3JFzmMuFbcQqIitprWdbAHyMsK4RKwAdKPvQrCc79vgsvNIxnQW3NNvc5drv2bZ
	KVs83dRINGRuKkQ9heeo6UPfpDZRDOKmtmP8mAelS14aJKOQF8M1FUAPt04tOpS7VV3RDgjbe4A
	Np/H8gLBrmU8CVBYPLX+e8gPTyve7f64Qj+kQUctdvkc2CQXy/77r4HHk83xadB2qd00YGzLz0l
	JWUi425XonOMJhiQZrecvvaPAssVue57eCMJasi8B9ylSkCtwg/+PqTu3xqW+Rx67uazpAr0TeA
	WXBG0QeUl4uwnloyft+1EhMJPBvltc4JQN12j5dllWy6c5NvAKOZcFpqhLmI6bfLj9iCH8Oe+51
	WI2K2+dplkwxiN4ngNaEXaYM8M+2EqVDkqhucJuqrUmZqDzT7q8+T+o5womVPZ4xoxtnMaRjtsg
	smLstdFzufzEq7Q6tS
X-Received: by 2002:a05:6000:3107:b0:490:f775:b00b with SMTP id ffacd0b85a97d-49c72e85bb3mr2535058f8f.52.1794530148832;
        Thu, 12 Nov 2026 16:35:48 -0800 (PST)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c60021375sm1838831f8f.29.2026.11.12.16.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 16:35:48 -0800 (PST)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
	arnd@arndb.de,
	krzk@kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/24] MAINTAINERS: Consolidate ARM/ZTE ZX SOC SUPPORT with Stefan Doesinger
Date: Fri, 13 Nov 2026 00:35:47 +0000
Message-ID: <20261113003547.3661166-1-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <f-cR3wroQOKOK55pQOGtvQ@gmail.com>
References: <20261014072109.1759502-1-ghahramani.navid@gmail.com> <20261014072109.1759502-2-ghahramani.navid@gmail.com> <f-cR3wroQOKOK55pQOGtvQ@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_163550_798758_D1371320 
X-CRM114-Status: GOOD (  10.91  )
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

Hi Stefan,

Stefan Dösinger wrote:
> I am generally OK with that, at least once Navid's patches 1-6 passed review.

Thanks. I will put that change in the last patch of the base series, so
it only goes in together with the reviewed patches.

> I think it is better to keep it ad "Odd fixes" as it is a hobby project to both
> myself and Navid.

Agreed, it stays Odd fixes.

> This should go into or near the patches that add the files in question.

OK. Each patch that adds files will add its own F: lines with explicit
file names like your entry, and I will drop the patterns that match no
file.

Best regards,
Navid

