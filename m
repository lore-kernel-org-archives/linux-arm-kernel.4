Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C609E606A321
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Nov 2026 23:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z30TCVYj;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xWXjR4wK
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=; b=z30TCVYjkCBxe/tZ//ZdT0Vdv3
	w58qqq/ZwDkitDroqYZ5bkFRGXw6yHnkY2i2leUqEbeEARll7GnBlvsFk64jPYJ9+eG83VLUJT8F/
	W7YupxoJTR0zpMlZjwocwWudeAOukWEY1yfpQempCbUTh8jiVLvcNlbgSZHCSnigA0u2N7MBCuajH
	Jjp+iEpJ+yFeN0YLm1GQcL0PUn25K0yyFzF3APoDBGz5zkASIWv0nifc7jrNt7GSm48pvYfATXvhQ
	85bckfUpnCBKjIbPgzij+0eEyn/flU45aaa02aGnkIo/qVFuvt0UADn1Jcx7qwFoMtrQqNS5/+C6X
	t2u9ZS6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzh6-000000083ar-1ofQ;
	Tue, 24 Nov 2026 23:13:00 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVzh3-000000083a8-2dse
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Nov 2026 23:12:59 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4bba5e17cbeso712065e9.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Nov 2026 15:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795561976; x=1796166776; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
        b=xWXjR4wKELDZMnqSJFTNC1IinH1LfzI8C35YuBWSt0vMnMdW4RF1JGxnTC+wxMDRlE
         3r17Kfy9/+nmkpjmHHjQaMOFt4WZU8GmvUAa2HlkiZ8aQorQfZD4cAdjuGQvJlMOZFAW
         B3yEENlkNychFi21AYq6m6NvmNUWiCxkXwyr7rqJJB5pXEPswav0ZHe2ZbeOfUeTf3CK
         SCL+otBOqkPpsPJzMIfT/oyyKLvepKpPluojVIkWcDsS4xSOEwkjmnOYFJqrngEtyncc
         I7sqp5QgMaAqjo3AzfeKDoW+RQ0D04zliROnFvcSu6a35962dZL/RWEWQWMmW64Yt0Z+
         XkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795561976; x=1796166776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fu1JR9BwCRRgF7zql9PraHs0kE4B88Qxih1JN4hThMw=;
        b=tjgCoe2cxQ88VxTXQxF0zkg40BR9sPeYatwBxAZHqn03qPZTt+Wcro34PRWkx2kRDN
         k4jPv/JDk4WhpQjoWc0ilrmcA2oCBhTfYs3Jq2tZi76Sqlpmr4LJ82IZbTKb9DFRNbOH
         ZaK8RxKFsX8R/aqPpwENUd/zHOqFrNoYNgA3ABjuH3ZWm5f93m/AWopBadylH8+jkqkd
         +h/MvbcGyIkEQFjfSdOt2NFlt9hObTN5ywb5ZPOg2wcARoKer66L8f2LT2O7Znb+b+Sw
         Lqluyo5K1UITQ2aOiAxDBPEUjS6mp1KCbYymTiNaSNdqeKKY421G8bDghDbcl8fe8YhS
         mz4A==
X-Forwarded-Encrypted: i=1; AL+hErG4F6r9xnEj8mGd3X3sC8olZWSavHcOXoGGQN6eWNdrdrrDMENdPoQ1bAE3spfpEEt03kqjVGtbWdR3GBzwof/Y@lists.infradead.org
X-Gm-Message-State: APuU4Z8hTrkLbhnM6tpsmRJ8SkyBixGhoDpDCA0ES7AX+z/vah4xpEKy
	jqc036sV94dJsHgz6V/+JBZ44sKStjctQFMsu4ELrS93nnOmimhRJlf0
X-Gm-Gg: AZFdTZdge9MHQJcP3Km+hG8u+2ZCoo+WAz6IRiDTsNNhft+ty+ju0Rt1fi2r5Zo5EEL
	G9khT9J0hrwYoBvvTmFSNud21BJRBkiwRjzDNegNLXvpFzQouiRRWKN+sGvrjbwUsE2IhqR3CYJ
	fJkOwcnqWi7zbMn42hn0AAvjvTNOsSuCsrXhK364Ee9pJZ/03fXL9TRm6ptfoFVTvDO4nm9r5QR
	nFy2wVUMBy+vuAoo7zNJk32VA4Fld6se2N7YznkISV+tE3JcjQjG3vI51k64+3aQ0NnGlDZt6nq
	XGnHZu9zeKtp3OGu/y5YUqJ9uVBMhqAVdi0ZEyNwfijr2sMCtpc/E7QHwScS5hPpYk9cZ48MJw2
	OeaykFIqlttYd+I2fujIeYZDAB+3GFncntUKQe7lFSJLK3AocFLgKpa0Le3Zp7ACjIq4lkZ4p3q
	+0oDhiFQg82w7FC62T1pusE9wqe+vyHpncl9po3vBIOp+TAiQ6CaoAu1Q7owtNox2vz12bX1t2I
	xm6IlgVNHDFm/7rUCTaonG3sXPCw4NWRY4h+W8oxvZJQ9nfiJVkeQJwoCB5/NNwOauJHGuI9beh
	OqxuCPKiKcbzPjZYlf51Glm2vUSANAobUzc0MHW9yvl0sHUQ1rFNawrDfe3f9l/wQubM6FMRmJ0
	sGzi4+HOygHqb2M/jMfBSc8/h
X-Received: by 2002:a05:600c:3491:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb8880014dmr336408085e9.10.1795561975632;
        Tue, 24 Nov 2026 15:12:55 -0800 (PST)
Received: from Ansuel-XPS24.localdomain ([87.13.246.159])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4bb8538b3a7sm527766585e9.3.2026.11.24.15.12.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 15:12:55 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	llvm@lists.linux.dev
Cc: kernel test robot <lkp@intel.com>
Subject: [PATCH] ASoC: airoha: fix objtool warning with memif probe loop
Date: Wed, 25 Nov 2026 00:12:43 +0100
Message-ID: <20261124231245.271869-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_151257_710561_ED85131C 
X-CRM114-Status: GOOD (  17.15  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Objtool produce a warning when clang is used as compiler. This was caused
by the memif probe loop when assigning the irq to the memif.

The warning is:
>> sound/soc/mediatek/an7581/snd-soc-an7581-afe.o: warning: objtool: an7581_afe_pcm_dev_probe(): unexpected end of section .text.an7581_afe_pcm_dev_probe

Fix this by giving a fixed upper bound for the loop for the memif as it
seems there are some problem with detecting the runtime value is hardcoded.

Fixes: 4974ffa0d6c2 ("ASoC: airoha: Add AFE driver for Airoha AN7581")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202611201414.1NBNxorL-lkp@intel.com/
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 sound/soc/mediatek/an7581/an7581-afe-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/mediatek/an7581/an7581-afe-pcm.c b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
index d47edb630452..b17d58f25d9e 100644
--- a/sound/soc/mediatek/an7581/an7581-afe-pcm.c
+++ b/sound/soc/mediatek/an7581/an7581-afe-pcm.c
@@ -447,7 +447,7 @@ static int an7581_afe_pcm_dev_probe(struct platform_device *pdev)
 		return irq_id;
 
 	/* init memif */
-	for (i = 0; i < afe->memif_size; i++) {
+	for (i = 0; i < AN7581_MEMIF_NUM; i++) {
 		int sel_irq = an7581_memif_irq_descs[i].irq;
 
 		afe->memif[i].data = &memif_data[i];
-- 
2.55.0


